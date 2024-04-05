*** Settings ***
Resource    ../tests/utils/resources.robot

*** Keywords ***
Create a new company
    ${body}              Create Dictionary                           corporateName=${company_corporateName}    registerCompany=${CNPJ}    
    ...                  mail=${COMPANY_MAIL}                        matriz=${company_matriz}                              
    ...                  responsibleContact=${responsibleContact}    telephone=${company_telephone}    serviceDescription=${serviceDescription}    
    ...                  address=${address}    
    Log                  ${body}
    Create API admin session
    ${response}          POST On Session       alias=${alias}          url=/api/company/          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${COMPANY_ID}            ${response.json()["newCompany"]["_id"]}
    Set Test Variable    ${RESPONSE}              ${response.json()}

Check if the new company was created
    Log                               ${RESPONSE}
    Dictionary Should Contain key     ${RESPONSE}[newCompany]    _id