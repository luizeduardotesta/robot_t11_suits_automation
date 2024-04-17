*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Update the created board name
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_board}    PUT On Session       alias=${alias}     url=${board_url}${BOARD_ID}    expected_status=200    headers=${headers}    
    ...    data={"boardName":"${BOARD_NAME}"}

List the updated board
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=${board_url}${BOARD_ID}      expected_status=200    headers=${headers}
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the updated board data
    Dictionary Should Contain Item    ${GET_RESPONSE}[board]    boardName    ${BOARD_NAME}