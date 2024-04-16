*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Scenario with GET: Listing a company successfully
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data

Scenario with GET: Counting all company successfully
    Login with admin
    Inicial count companys
    Create company data
    Create a new company
    Updated count companys
    Check company count increase