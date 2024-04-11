*** Settings ***
Library          FakerLibrary
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    Close Browser

*** Variables ***
${USER_MAIL}
${CPF}

*** Test Cases ***
Login as system admin   
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}  

    Given User is on the login page
    When User inserts the admin email and password    ${admin_auth}
    Then User is redirected to the home page

Login as user
    Create user data
    
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}  

    ${user_auth}     Create Dictionary
    ...    mail=${USER_MAIL}
    ...    password=${password}  

    ${create_user}    Create Dictionary
    ...    fullName=${fullName} 
    ...    mail=${USER_MAIL}
    ...    accessProfile=${accessProfile}
    ...    cpf=${CPF}
    ...    password=${password}
    ...    confirmPassword=${confirmPassword}

    Given User is on the login page
    When User inserts the admin email and password    ${admin_auth}
    and User is redirected to the home page
    Then User fill the register user form             ${create_user}
    When User is logout of the page
    and User inserts their own email and password     ${user_auth}
    Then User is redirected to the home page
    