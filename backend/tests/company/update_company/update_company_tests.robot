*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com PUT: Editar os dados da empresa com sucesso
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data
    Update the created company data
    List the updated company
    Check the updated company data

Cenario com PUT: Editar o emdereço da empresa com sucesso
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data
    Update the created company address
    List the updated company
    Check the updated company address

Cenario com PUT: Editar o status da empresa com sucesso
    Login with admin
    Create company data
    Create a new company
    List the created company
    Update the created company status