*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with POST: Successfully register a new company
    Login with admin
    Create company data
    Create a new company
    Check if the new company was created