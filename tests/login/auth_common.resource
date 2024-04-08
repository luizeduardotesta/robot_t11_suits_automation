*** Settings ***
Resource    ../utils/resources.robot

*** Keywords ***
Create API user session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${USER_TOKEN}    
    Create Session    alias=${alias}       url=${url}     headers=${headers}    disable_warnings=${true}

Login with user
    ${body}    Create Dictionary    mail=${USER_MAIL}    password=${user_password}
    Log                  ${body}
    Create API user session
    ${response}    POST On Session    alias=${alias}    url=/api/login/    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${USER_TOKEN}              ${response.json()["token"]}
    Log    ${USER_TOKEN}
    Dictionary Should Contain Item    ${response.json()}    msg    Olá ${user_fullName}, autenticação autorizada com sucesso!
