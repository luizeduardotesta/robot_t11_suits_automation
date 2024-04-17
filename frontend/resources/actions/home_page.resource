*** Settings ***
Documentation    Keywords related to login functionality
Library          SeleniumLibrary
Library          String
Variables        ../../config/front_data.yaml
Resource         ../variables/data.resource

*** Keywords ***
User is logged as admin
    Go To                            url=${login_url}
    Wait Until Element Is Visible    ${adminMailInput}

    [Arguments]                      ${admin_auth}
    Input Text                       ${adminMailInput}    ${admin_auth}[mail]
    Input Password                   ${passwordInput}     ${admin_auth}[password]
    Click Button                     ${loginButton}

User is on the home page
    Wait Until Element Is Visible    ${logoutButton}
    Location Should Be               ${home_url}  
 
User is logout of the page
    Click Button       ${logoutButton}
    Wait Until Element Is Visible    ${loginText}
    Location Should Be               ${login_url}