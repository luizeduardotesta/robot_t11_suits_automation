*** Settings ***
Resource    ./utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com DELETE: Deletar um usuário com sucesso
    Login with admin
    Create user data
    Create a new user
    List the created user
    Delete the created user
    Check if the user was deleted