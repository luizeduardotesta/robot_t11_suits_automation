*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
List the created user
    ${get_response}    GET On Session    alias=${alias}          url=${user_url}${USER_ID}      expected_status=200
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the created user data
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    ${user_fullName}
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}
    Dictionary Should Contain Item    ${GET_RESPONSE}    cpf         ${CPF}
    Dictionary Should Contain Item    ${GET_RESPONSE}    _id         ${USER_ID}

Inicial count users
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=${count_user_url}      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${inicial_count_result}    ${get_response["count"]}

Updated count users
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=${count_user_url}      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${updated_count_result}    ${get_response["count"]}

Check user count increase
    Should Be True    ${updated_count_result} == ${inicial_count_result} + 1