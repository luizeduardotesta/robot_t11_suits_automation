*** Settings ***
Resource    ../resources/users_tests.resource

*** Variables ***
${TOKEN}

*** Test Cases ***
Cenario com GET: Listar um usuário com sucesso
    Login with admin
    Create user data
    Create a new ususer
    List the created user
    Check the created user data