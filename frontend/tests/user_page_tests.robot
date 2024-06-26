*** Settings ***
Library          FakerLibrary
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    Close Browser

*** Variables ***
${USER_MAIL}
${CPF}

*** Test Cases ***
Register a user
    Create user data
    
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}

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
    Then User fill the register user form     ${create_user}

User redirect to home page by click the home icon 
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}   

    Given User is logged as admin    ${admin_auth}
    When User is on the home page 
    Then User click home icon

User click on next and previous button to chage the pagination
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password} 

    Given User is logged as admin    ${admin_auth}
    When User is on the home page 
    and User clicks the next page button
    Then User should be on the next page
    When User clicks the previous page button
    Then User should be on the previous page