*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with GET: Listing a board successfully
    Login with admin
    Create board data
    Create a new board
    List the created board
    Check the created board data

Scenario with GET: Counting all boards successfully
    Login with admin
    Inicial count boards
    Create board data
    Create a new board
    Updated count boards
    Check board count increase
