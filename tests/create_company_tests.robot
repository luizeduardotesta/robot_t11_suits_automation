*** Settings ***
Resource    ../resources/companys_tests.resource

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com POST: Cadastrar um novo usuário com sucesso
    Login with admin
    Create company data
    Create a new company
    Check if the new company was created