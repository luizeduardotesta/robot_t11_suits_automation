*** Settings ***
Documentation
Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Resource     users_tests.resource
Variables    test_data/test_data.yaml

*** Keywords ***
Create company data
    ${generate_cnpj}        Generate Random String    14    [NUMBERS]
    Log                     ${generate_cnpj}
    Set Test Variable       ${CNPJ}                   ${generate_cnpj}
    ${random_word}          Generate Random String    8     [LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${COMPANY_MAIL}           ${random_word}@qacoders.com.br
    Log                     ${COMPANY_MAIL} 

Create a new company
    ${body}              Create Dictionary                           corporateName=${company_corporateName}    registerCompany=${CNPJ}    
    ...                  mail=${COMPANY_MAIL}                        matriz=${company_matriz}                              
    ...                  responsibleContact=${responsibleContact}    telephone=${company_telephone}    serviceDescription=${serviceDescription}    
    ...                  address=${address}    
    Log                  ${body}
    Create API admin session
    ${response}          POST On Session       alias=APIsuits          url=/api/company/          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${COMPANY_ID}            ${response.json()["newCompany"]["_id"]}
    Set Test Variable    ${RESPONSE}              ${response.json()}

Check if the new company was created
    Log                               ${RESPONSE}
    Dictionary Should Contain key     ${RESPONSE}[newCompany]    _id