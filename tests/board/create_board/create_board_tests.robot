*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com POST: Cadastrar uma nova diretoria com sucesso
    Login with admin
    Create board data
    Create a new board
    Check if the new board was created