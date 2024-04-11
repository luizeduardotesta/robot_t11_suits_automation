*** Settings ***
Library          FakerLibrary
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    Close Browser

*** Variables ***
${USER_MAIL}
${CPF}

*** Test Cases ***
Test case: Register a user with the administrator profile
    Create user data
    
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}

    ${create_user}    Create Dictionary
    ...    fullName=Luiz Testa 
    ...    mail=${USER_MAIL}
    ...    accessProfile=ADMIN
    ...    cpf=${CPF}
    ...    password=Test@1234
    ...    confirmPassword=Test@1234    

    Given User is on the login page
    When User the login data and click the login button    ${admin_auth}
    and User is redirected to the signup page logged in as an admin
    Then User fill the register user form     ${create_user}
    