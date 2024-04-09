*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
List the created board
    ${get_response}    GET On Session    alias=${alias}          url=/api/board/${BOARD_ID}      expected_status=200
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the created board data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}[board]    boardName    ${BOARD_NAME}
    Dictionary Should Contain Item    ${GET_RESPONSE}[board]    boardCode    ${BOARD_CODE}
    Dictionary Should Contain Item    ${GET_RESPONSE}[board]    status       ${BOARD_STATUS}
    Dictionary Should Contain Item    ${GET_RESPONSE}[board]    _id          ${BOARD_ID}

Inicial count boards
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=/api/board/count/      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${inicial_count_result}    ${get_response["count"]}

Updated count boards
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=/api/board/count/      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${updated_count_result}    ${get_response["count"]}

Check board count increase
    Log    ${inicial_count_result}
    Log    ${updated_count_result}
    Should Be True    ${updated_count_result} == ${inicial_count_result} + 1