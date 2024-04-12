*** Settings ***
Resource    ../utils/resources.robot

*** Variables ***
${env}

*** Keywords ***
Create API admin session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${ADMIN_TOKEN}    
    Create Session    alias=${alias.${env}}       url=${url.${env}}    headers=${headers}    disable_warnings=${true}

Login with admin
    [Documentation]    Logs in as admin and retrieves the authentication token.
    ${body}    Create Dictionary    mail=${admin_mail}    password=${admin_password}
    Create API admin session
    ${response}    POST On Session    alias=${alias.${env}}    url=${login_url}    json=${body}    expected_status=200
    Set Test Variable    ${ADMIN_TOKEN}              ${response.json()["token"]}
    Should Not Be Empty    ${ADMIN_TOKEN}