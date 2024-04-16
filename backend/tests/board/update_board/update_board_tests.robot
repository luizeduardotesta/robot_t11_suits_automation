*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with PUT: Editing the board name successfully
    Login with admin
    Create board data
    Create a new board
    List the created board
    Check the created board data
    Update the created board name
    List the updated board
    Check the updated board data