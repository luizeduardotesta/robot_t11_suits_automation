*** Settings ***
Documentation    Keywords related to login functionality
Library          SeleniumLibrary
Library          String
Variables        ../../config/front_data.yaml
Resource         ../variables/data.resource

*** Keywords ***
User is on the login page
    Go To    url=${login_url}

User inserts the admin email and password
    Wait Until Element Is Visible    ${adminMailInput}

    [Arguments]        ${admin_auth}
    Input Text         ${adminMailInput}    ${admin_auth}[mail]
    Input Password     ${passwordInput}     ${admin_auth}[password]
    Click Button       ${loginButton}

User inserts their own email and password
    Wait Until Element Is Visible    ${adminMailInput}

    [Arguments]        ${user_auth}
    Input Text         ${adminMailInput}    ${user_auth}[mail]
    Input Password     ${passwordInput}     ${user_auth}[password]
    Click Button       ${loginButton}

User is redirected to the home page
    Wait Until Element Is Visible    ${logoutButton}
    Location Should Be               ${home_url}
    Capture Page Screenshot