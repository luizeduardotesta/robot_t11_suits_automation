*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
POST: Registering a new board successfully
    Login with admin
    Create board data
    Create a new board
    Check if the new board was created