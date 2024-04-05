*** Settings ***
Resource    ./utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}
${USER_TOKEN}

*** Test Cases ***
Cenario com PUT: Editar o nome compelto do usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data
    Login with user
    Update the created user fullName and mail
    List the updated user
    Check the updated user data

Cenario com PUT: Editar o status do usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    List the created user
    Update the created user status

Cenario com PUT: Editar a senha do usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    List the created user
    Check the created user data
    Login with user
    Update the created user password
    List the updated user
    Check the updated user password