*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Create a new company
    ${CNPJ}    Generate CNPJ
    Set Test Variable    ${CNPJ}
    
    ${address}     Create Dictionary
    ...    zipCode=${company_zipCode}    country=${company_country}    city=${company_city}    state=${company_state}    district=${company_district}    
    ...    street=${company_street}      number=${company_number}      complement=${company_complement}
    
    ${address_list}    Create List    ${address}
      
    ${body}              Create Dictionary                   corporateName=${company_corporateName}    registerCompany=${CNPJ}    
    ...                  mail=${COMPANY_MAIL}                matriz=${company_matriz}        responsibleContact=${responsibleContact}                      
    ...                  telephone=${company_telephone}      serviceDescription=${serviceDescription}    address=${address_list}                        
    Create API admin session
    ${response}          POST On Session       alias=${alias.${env}}          url=${company_url}          json=${body}    expected_status=201
    Set Test Variable    ${COMPANY_ID}            ${response.json()["newCompany"]["_id"]}
    Set Test Variable    ${RESPONSE}              ${response.json()}

Check if the new company was created
    Should Not Be Empty              ${RESPONSE}[newCompany]                _id
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                corporateName         ${company_corporateName}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                registerCompany       ${CNPJ}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                mail                  ${COMPANY_MAIL}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                matriz                ${company_matriz}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                responsibleContact    ${responsibleContact}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                telephone             ${company_telephone}
    Dictionary Should Contain Key    ${RESPONSE}[newCompany]                serviceDescription    ${serviceDescription}
    List Should Contain Value        ${RESPONSE}[newCompany]                address

    ${address_info}    Get From Dictionary    ${RESPONSE}[newCompany]      address    default=None
    Dictionary Should Contain Key    ${address_info[0]}    country         Brasil
    Dictionary Should Contain Key    ${address_info[0]}    zipCode         99999999
    Dictionary Should Contain Key    ${address_info[0]}    city            Sao Paulo
    Dictionary Should Contain Key    ${address_info[0]}    state           SP
    Dictionary Should Contain Key    ${address_info[0]}    district        Rua das Flores
    Dictionary Should Contain Key    ${address_info[0]}    street          Avenida Interlagos
    Dictionary Should Contain Key    ${address_info[0]}    number          50
    Dictionary Should Contain Key    ${address_info[0]}    complement      de 4503 ao fim - lado impar