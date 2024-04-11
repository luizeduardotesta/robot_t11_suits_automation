*** Settings ***
Documentation    Keywords related to login functionality
Library          SeleniumLibrary
Library          String
Variables        ../../config/front_data.yaml
Resource         ../variables/data.resource

*** Keywords ***
User is on the login page
    Go To    url=${login_url}

User the login data and click the login button
    Wait Until Element Is Visible    ${adminMailInput}

    [Arguments]        ${admin_auth}
    Input Text         ${adminMailInput}    ${admin_auth}[mail]
    Input Password     ${passwordInput}     ${admin_auth}[password]
    Click Button       ${loginButton}

User is redirected to the signup page logged in as an admin
    Wait Until Element Is Visible    ${logoutButton}
    Location Should Be               ${home_url}
    Capture Page Screenshot



    



    