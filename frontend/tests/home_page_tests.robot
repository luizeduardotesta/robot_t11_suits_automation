*** Settings ***
Library          FakerLibrary
Resource         ../resources/base.resource
Test Setup       Start Session
Test Teardown    Close Browser

*** Variables ***
${USER_MAIL}
${CPF}

*** Test Cases ***
User logout of the page  
    ${admin_auth}     Create Dictionary
    ...    mail=${admin_mail}
    ...    password=${admin_password}   

    Given User is logged as admin    ${admin_auth}
    When User is on the home page    
    Then User is logout of the page