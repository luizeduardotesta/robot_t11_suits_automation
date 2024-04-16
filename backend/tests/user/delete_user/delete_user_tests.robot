*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with DELETE: Delete a user Successfully
    [Documentation]    Scenario to test delete a user with success.
    [Tags]    success    
    Login with admin
    Create user data
    Create a new user
    List the created user
    Delete the created user
    Check if the user was deleted