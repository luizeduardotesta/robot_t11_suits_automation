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

User fill the register user form
    Click Element                    ${cadastroList}
    Click Element                    ${usuariosList}
    Wait Until Element Is Visible    ${novoCadastroButton}
    Click Button                     ${novoCadastroButton}

    [Arguments]        ${create_user}
    Input Text         ${fullNameInput}           ${create_user}[fullName]
    Input Text         ${userMailInput}           ${create_user}[mail]
    Input Text         ${accessProfileInput}      ${create_user}[accessProfile]
    Input Text         ${cpfInput}                ${create_user}[cpf]
    Input Password     ${passwordInput}           ${create_user}[password]
    Input Password     ${confirmPasswordInput}    ${create_user}[confirmPassword]
    Capture Page Screenshot
    Click Button       ${saveButton}



    



    