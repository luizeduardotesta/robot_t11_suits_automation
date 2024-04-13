*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Create a new board
    ${body}              Create Dictionary     boardName=${BOARD_NAME}
    Create API admin session
    ${response}          POST On Session       alias=${alias.${env}}          url=${board_url}          json=${body}    expected_status=201
    Set Test Variable    ${BOARD_ID}            ${response.json()["newBoard"]["_id"]}
    Set Test Variable    ${BOARD_CODE}          ${response.json()["newBoard"]["boardCode"]}
    Set Test Variable    ${BOARD_STATUS}        ${response.json()["newBoard"]["status"]}
    Set Test Variable    ${RESPONSE}            ${response.json()}

Check if the new board was created
    Dictionary Should Contain Item    ${RESPONSE}    msg          Cadastro realizado com sucesso!
    Dictionary Should Contain Item    ${RESPONSE}[newBoard]       boardName    ${BOARD_NAME}
    Dictionary Should Contain key     ${RESPONSE}[newBoard]       _id