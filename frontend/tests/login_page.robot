*** Settings ***
Library          FakerLibrary
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    Close Browser

*** Variables ***
${USER_MAIL}
${CPF}

*** Test Cases ***
Test case: Login as system admin
    Create user data
    
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}  

    Given User is on the login page
    When User the login data and click the login button    ${admin_auth}
    Then User is redirected to the signup page logged in as an admin
    