*** Settings ***
Resource    ../tests/utils/resources.robot

*** Keywords ***
Create a new user
    ${body}              Create Dictionary     fullName=${user_fullName}          mail=${USER_MAIL}    password=${user_password}    accessProfile=ADMIN    
    ...    cpf=${CPF}    confirmPassword=${user_password} 
    Log                  ${body}
    Create API admin session
    ${response}          POST On Session       alias=${alias}          url=/api/user/          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${USER_ID}            ${response.json()["user"]["_id"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}

Check if the new user was created
    Log                               ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    msg    Olá ${user_fullName}, cadastro realizado com sucesso.
    Dictionary Should Contain key     ${RESPONSE}[user]    _id

List the created user
    ${get_response}    GET On Session    alias=${alias}          url=/api/user/${USER_ID}      expected_status=200
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the created user data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    ${user_fullName}
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}
    Dictionary Should Contain Item    ${GET_RESPONSE}    cpf         ${CPF}
    Dictionary Should Contain Item    ${GET_RESPONSE}    _id         ${USER_ID}

Inicial count users
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=/api/user/count/      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${inicial_count_result}    ${get_response["count"]}

Updated count users
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=/api/user/count/      expected_status=200    headers=${headers}
    Set Test Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${updated_count_result}    ${get_response["count"]}

Check User Count Increase
    Log    ${inicial_count_result}
    Log    ${updated_count_result}
    Should Be True    ${updated_count_result} == ${inicial_count_result} + 1

Update the created user fullName and mail
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${update_user_fullname}    PUT On Session       alias=${alias}     url=/api/user/${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"fullName":"Luiz Eduardo", "mail":"${USER_MAIL}"}

Update the created user password
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${update_password}    PUT On Session       alias=${alias}     url=/api/user/password/${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"password":"Test@1234", "confirmPassword":"Test@1234"}
    Set Test Variable    ${PUT_RESPONSE}    ${update_password.json()}
    Dictionary Should Contain Item    ${PUT_RESPONSE}    msg    Senha atualizada com sucesso!

Update the created user status
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_status}    PUT On Session       alias=${alias}     url=/api/user/status/${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"status":"true"}
    Set Test Variable    ${PUT_RESPONSE}    ${update_status.json()}
    Dictionary Should Contain Item    ${PUT_RESPONSE}    msg    Status do usuario atualizado com sucesso para status true.
    
List the updated user
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${get_response}    GET On Session    alias=${alias}          url=/api/user/${USER_ID}      expected_status=200    headers=${headers}
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${hashed_password}    ${get_response["password"]}

Check the updated user data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    Luiz Eduardo
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}

Check the updated user password
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    password    ${hashed_password}

Delete the created user
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${delete_user}    DELETE On Session       alias=${alias}     url=/api/user/${USER_ID}    expected_status=200    headers=${headers}
    Set Test Variable    ${DELETE_RESPONSE}    ${delete_user.json()} 

Check if the user was deleted
    Log    ${DELETE_RESPONSE}
    Dictionary Should Contain Item    ${DELETE_RESPONSE}    msg    Usuário deletado com sucesso!.