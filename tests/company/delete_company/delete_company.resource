*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Delete the created company
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${delete_company}    DELETE On Session       alias=${alias}     url=${company_url}${COMPANY_ID}    expected_status=200    headers=${headers}
    Set Test Variable    ${DELETE_RESPONSE}    ${delete_company.json()} 

Check if the company was deleted
    Log    ${DELETE_RESPONSE}
    Dictionary Should Contain Item    ${DELETE_RESPONSE}    msg    Companhia deletado com sucesso.