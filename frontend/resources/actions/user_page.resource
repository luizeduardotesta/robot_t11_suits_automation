*** Settings ***
Documentation    Keywords related to login functionality
Library          SeleniumLibrary
Library          String
Variables        ../../config/front_data.yaml
Resource         ../variables/data.resource

*** Keywords ***
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
 
User click home icon 
    Click Element                    ${cadastroList}
    Click Element                    ${usuariosList}
    Wait Until Element Is Visible    ${homeIcon}
    Click Element                    ${homeIcon}
    Capture Page Screenshot

User clicks the next page button
    Click Element                    ${cadastroList}
    Click Element                    ${usuariosList}
    Wait Until Element Is Visible    ${nextPageButton}
    Click Element                    ${nextPageButton}
    Capture Page Screenshot

User clicks the previous page button
    Click Element    ${previousPageButton}
    Capture Page Screenshot

User should be on the next page
    Should Contain    ${paginationNext}    31-60

User should be on the previous page
    Should Contain    ${paginationPrevious}    1-30