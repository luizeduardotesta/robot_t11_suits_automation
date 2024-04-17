*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
List the created company
    ${get_response}    GET On Session    alias=${alias}          url=${company_url}${COMPANY_ID}      expected_status=200
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the created company data
    ${expected_telephone}             Convert To string                       ${company_telephone}
    Dictionary Should Contain Item    ${GET_RESPONSE}    corporateName         ${company_corporateName}
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail                  ${COMPANY_MAIL}
    Dictionary Should Contain Item    ${GET_RESPONSE}    registerCompany       ${CNPJ}
    Dictionary Should Contain Item    ${GET_RESPONSE}    matriz                ${company_matriz}
    Dictionary Should Contain Item    ${GET_RESPONSE}    responsibleContact    ${responsibleContact}
    Dictionary Should Contain Item    ${GET_RESPONSE}    telephone             ${expected_telephone}
    Dictionary Should Contain Item    ${GET_RESPONSE}    serviceDescription    ${serviceDescription}
    Dictionary Should Contain Item    ${GET_RESPONSE}    _id                   ${COMPANY_ID}

Inicial count companys
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}    url=${count_company_url}   expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${inicial_count_result}    ${get_response["count"]}

Updated count companys
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}    url=${count_company_url}   expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${updated_count_result}    ${get_response["count"]}

Check company count increase
    Should Be True    ${updated_count_result} == ${inicial_count_result} + 1