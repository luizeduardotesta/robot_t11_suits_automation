*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com GET: Listar uma empresa com sucesso
    Login with admin
    Create company data
    Create a new company
    List the created company
    Check the created company data

Cenario com GET: Contar todas as empresa com sucesso
    Login with admin
    Inicial count companys
    Create company data
    Create a new company
    Updated count companys
    Check company count increase