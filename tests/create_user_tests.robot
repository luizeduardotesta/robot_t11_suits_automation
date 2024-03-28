*** Settings ***
Resource    ../resources/users_tests.resource

*** Variables ***
${token}

*** Test Cases ***
Cenario com POST: Cadastrar um novo usuário com sucesso
    Login with admin
    Create user data
    Generate CPF
    Create a new ususer
    Check if the new user was created