*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with GET: Listing a user successfully
    [Documentation]    Scenario to test list a user with success.
    [Tags]    success
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data

Scenario with GET: Counting all user successfully
    [Documentation]    Scenario to test count a user with success.
    [Tags]    success
    Login with admin
    Inicial count users
    Create user data
    Create a new user
    Updated count users
    Check user count increase
