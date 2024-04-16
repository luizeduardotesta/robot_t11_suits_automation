*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with DELETE: Delete a company Successfully
    Login with admin
    Create company data
    Create a new company
    List the created company
    Delete the created company
    Check if the company was deleted