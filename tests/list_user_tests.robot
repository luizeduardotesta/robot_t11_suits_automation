*** Settings ***
Resource    ../resources/users_tests.resource

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com GET: Listar um usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data

Cenario com GET: Contar todos os usuários com sucesso
    Login with admin
    Count users
    Create user data
    Create a new user
    Count users
