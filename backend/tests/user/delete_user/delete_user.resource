*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Delete the created user
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${delete_user}    DELETE On Session       alias=${alias.${env}}     url=${user_url}${USER_ID}    expected_status=200    headers=${headers}
    Set Test Variable    ${DELETE_RESPONSE}    ${delete_user.json()} 

Check if the user was deleted
    Dictionary Should Contain Item    ${DELETE_RESPONSE}    msg    Usuário deletado com sucesso!.