*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Create a new user
    ${CPF}    Generate CPF
    Set Test Variable    ${CPF}

    ${body}              Create Dictionary     fullName=${user_fullName}          mail=${USER_MAIL}    password=${user_password}    
    ...                  accessProfile=ADMIN    cpf=${CPF}    confirmPassword=${user_password} 
    Log                  ${body}
    Create API admin session
    ${response}          POST On Session       alias=${alias.${env}}          url=${user_url}          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${USER_ID}            ${response.json()["user"]["_id"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}

Check if the new user was created
    Log                               ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    msg    Olá ${user_fullName}, cadastro realizado com sucesso.
    Dictionary Should Contain key     ${RESPONSE}[user]    _id