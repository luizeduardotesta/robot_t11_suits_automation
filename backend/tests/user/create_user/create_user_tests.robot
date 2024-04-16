*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with POST: Successfully register a new user
    [Documentation]    Scenario to test registering a new user with success.
    [Tags]    success
    Login with admin
    Create user data
    Create a new user
    Check if the new user was created

Scenario with POST: Register a new user without full name
    [Documentation]    Scenario to test registering a new user without providing the full name.
    [Tags]    Error
    Login with admin
    Create user data
    Create a new user without full name

Scenario with POST: Register a new user without CPF
    [Documentation]    Scenario to test registering a new user without providing the CPF.
    [Tags]    Error
    Login with admin
    Create user data
    Create a new user without CPF

Scenario with POST: Register a new user without email
    [Documentation]    Scenario to test registering a new user without providing the email.
    [Tags]    Error
    Login with admin
    Create user data
    Create a new user without email