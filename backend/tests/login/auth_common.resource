*** Settings ***
Resource    ../utils/resources.robot

*** Variables ***
${env}

*** Keywords ***
Create API user session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${USER_TOKEN}    
    Create Session    alias=${alias}       url=${url}     headers=${headers}    disable_warnings=${true}

Login with user
    ${body}    Create Dictionary    mail=${USER_MAIL}    password=${user_password}
    Create API user session
    ${response}    POST On Session    alias=${alias}    url=${login_url}    json=${body}    expected_status=200
    Set Test Variable    ${USER_TOKEN}              ${response.json()["token"]}
    Dictionary Should Contain Item    ${response.json()}    msg    Olá ${user_fullName}, autenticação autorizada com sucesso!
    Should Not Be Empty    ${ADMIN_TOKEN}
