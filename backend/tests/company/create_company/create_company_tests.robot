*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com POST: Cadastrar uma nova compania com sucesso
    Login with admin
    Create company data
    Create a new company
    Check if the new company was created