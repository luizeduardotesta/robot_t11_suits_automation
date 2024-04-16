*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}
${USER_TOKEN}

*** Test Cases ***

Scenario with PUT: Successfully edit the user's full name
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data
    Login with user
    Update the created user fullName and mail
    List the updated user
    Check the updated user data

Scenario with PUT: Successfully edit the user's status
    Login with admin
    Create user data
    Create a new user
    List the created user
    Update the created user status

Scenario with PUT: Successfully edit the user's password
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data
    Login with user
    Update the created user password
    List the updated user
    Check the updated user password