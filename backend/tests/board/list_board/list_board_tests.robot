*** Settings ***
Resource    ../../utils/resources.robot

*** Variables ***
${ADMIN_TOKEN}

*** Test Cases ***
Cenario com GET: Listar uma diretoria com sucesso
    Login with admin
    Create board data
    Create a new board
    List the created board
    Check the created board data

Cenario com GET: Contar todas as diretoria com sucesso
    Login with admin
    Inicial count boards
    Create board data
    Create a new board
    Updated count boards
    Check board count increase
