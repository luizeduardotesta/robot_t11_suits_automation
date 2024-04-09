*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com PUT: Editar o nome da diretoria com sucesso
    Login with admin
    Create board data
    Create a new board
    List the created board
    Check the created board data
    Update the created board name
    List the updated board
    Check the updated board data