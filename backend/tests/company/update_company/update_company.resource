*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Update the created company data
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_company}    PUT On Session       alias=${alias.${env}}     url=${company_url}${COMPANY_ID}    expected_status=200    headers=${headers}    
    ...    data={"corporateName":"Testcompany", "mail":"${COMPANY_MAIL}", "matriz":"Teste", "responsibleContact":"Marcio"}

Update the created company address
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_address}    PUT On Session       alias=${alias.${env}}     url=${company_address_url}${COMPANY_ID}    expected_status=200    headers=${headers}    
    ...    data={"address":[{"zipCode":"99999998", "city":"Cascavel", "district":"Centro", "street":"Rua Recife", "number":"100", "country":"Brazil", "state":"PR"}]}
    Set Test Variable    ${PUT_RESPONSE}    ${update_address.json()}

Update the created company status
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_status}    PUT On Session       alias=${alias.${env}}     url=${company_status_url}${COMPANY_ID}    expected_status=200    headers=${headers}    
    ...    data={"status":"false"}
    Set Test Variable    ${PUT_RESPONSE}    ${update_status.json()}
    Dictionary Should Contain Item    ${PUT_RESPONSE}    msg    Status da companhia atualizado com sucesso.
    
List the updated company
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias.${env}}          url=${company_url}${COMPANY_ID}      expected_status=200    headers=${headers}
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the updated company data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    corporateName         Testcompany
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail                  ${COMPANY_MAIL}
    Dictionary Should Contain Item    ${GET_RESPONSE}    matriz                Teste
    Dictionary Should Contain Item    ${GET_RESPONSE}    responsibleContact    Marcio

Check the updated company address
    Log    ${GET_RESPONSE}
    ${address_list}    Get From Dictionary    ${GET_RESPONSE}    address    ${address}
    Log    ${address_list}
    Dictionary Should Contain Item    ${address_list[0]}    zipCode     99999998
    Dictionary Should Contain Item    ${address_list[0]}    city        Cascavel
    Dictionary Should Contain Item    ${address_list[0]}    district    Centro
    Dictionary Should Contain Item    ${address_list[0]}    street      Rua Recife
    Dictionary Should Contain Item    ${address_list[0]}    number      100
    Dictionary Should Contain Item    ${address_list[0]}    country     Brazil
    Dictionary Should Contain Item    ${address_list[0]}    state       PR