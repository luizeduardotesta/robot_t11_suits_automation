*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com POST: Cadastrar um novo usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    Check if the new user was created