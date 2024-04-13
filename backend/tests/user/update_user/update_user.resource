*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Update the created user fullName and mail
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${update_user_fullname}    PUT On Session       alias=${alias.${env}}     url=${user_url}${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"fullName":"Luiz Eduardo", "mail":"${USER_MAIL}"}

Update the created user password
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${update_password}    PUT On Session       alias=${alias.${env}}     url=${user_password_url}${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"password":"Test@1234", "confirmPassword":"Test@1234"}
    Set Test Variable    ${PUT_RESPONSE}    ${update_password.json()}
    Dictionary Should Contain Item    ${PUT_RESPONSE}    msg    Senha atualizada com sucesso!

Update the created user status
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${update_status}    PUT On Session       alias=${alias.${env}}     url=${user_status_url}${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"status":"true"}
    Set Test Variable    ${PUT_RESPONSE}    ${update_status.json()}
    Dictionary Should Contain Item    ${PUT_RESPONSE}    msg    Status do usuario atualizado com sucesso para status true.
    
List the updated user
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${get_response}    GET On Session    alias=${alias.${env}}          url=${user_url}${USER_ID}      expected_status=200    headers=${headers}
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}
    Set Test Variable    ${hashed_password}    ${get_response["password"]}

Check the updated user data
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    Luiz Eduardo
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}

Check the updated user password
    Dictionary Should Contain Item    ${GET_RESPONSE}    password    ${hashed_password}