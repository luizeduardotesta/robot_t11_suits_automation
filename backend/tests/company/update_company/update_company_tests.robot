*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with PUT: Successfully edit company data
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data
    Update the created company data
    List the updated company
    Check the updated company data

Scenario with PUT: Successfully edit company address
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data
    Update the created company address
    List the updated company
    Check the updated company address

Scenario with PUT: Successfully edit company status
    Login with admin
    Create company data
    Create a new company
    List the created company
    Update the created company status