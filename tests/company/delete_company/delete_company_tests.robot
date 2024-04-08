*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com DELETE: Deletar uma empresa com sucesso
    Login with admin
    Create company data
    Create a new company
    List the created company
    Delete the created company
    Check if the company was deleted