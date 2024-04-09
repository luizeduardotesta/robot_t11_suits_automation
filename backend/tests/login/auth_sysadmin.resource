*** Settings ***
Resource    ../utils/resources.robot

*** Keywords ***
Create API admin session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${ADMIN_TOKEN}    
    Create Session    alias=${alias}       url=${url}    headers=${headers}    disable_warnings=${true}

Login with admin
    ${body}    Create Dictionary    mail=${admin_mail}    password=${admin_password}
    Log                  ${body}
    Create API admin session
    ${response}    POST On Session    alias=${alias}    url=${login_url}    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${ADMIN_TOKEN}              ${response.json()["token"]}
    Log    ${ADMIN_TOKEN}