*** Settings ***
Resource    ../../utils/resources.robot

*** Keywords ***
Create a new user
    ${CPF}    Generate CPF
    Set Test Variable    ${CPF}

    ${body}              Create Dictionary      fullName=${user_fullName}          mail=${USER_MAIL}    password=${user_password}    
    ...                  accessProfile=ADMIN    cpf=${CPF}                         confirmPassword=${user_password} 
    Create API admin session
    ${response}          POST On Session       alias=${alias}          url=${user_url}          json=${body}    expected_status=201
    Set Test Variable    ${USER_ID}            ${response.json()["user"]["_id"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}

Check if the new user was created
    Dictionary Should Contain Item    ${RESPONSE}    msg    Olá ${user_fullName}, cadastro realizado com sucesso.
    Dictionary Should Contain key     ${RESPONSE}[user]    _id

Create a new user without full name
    ${CPF}    Generate CPF
    Set Test Variable    ${CPF}
    
    ${body}    Create Dictionary     mail=${USER_MAIL}    password=${user_password}    accessProfile=ADMIN    cpf=${CPF}    
    ...        confirmPassword=${user_password}
    Create API admin session
    ${response}    POST On Session    alias=${alias}    url=${user_url}    json=${body}    expected_status=400

    Dictionary Should Contain Key     ${response.json()}           error
    List Should Contain Value         ${response.json()}[error]    O campo nome completo é obrigatório.

Create a new user without CPF
    ${body}    Create Dictionary     fullName=${user_fullName}    mail=${USER_MAIL}    password=${user_password}    accessProfile=ADMIN      
    ...        confirmPassword=${user_password}
    Create API admin session
    ${response}    POST On Session    alias=${alias}    url=${user_url}    json=${body}    expected_status=400

    Dictionary Should Contain Key     ${response.json()}           error
    List Should Contain Value         ${response.json()}[error]    O campo CPF é obrigatório!

Create a new user without email
    ${CPF}    Generate CPF
    Set Test Variable    ${CPF}
    
    ${body}    Create Dictionary     fullName=${user_fullName}    password=${user_password}    accessProfile=ADMIN    cpf=${CPF}    
    ...        confirmPassword=${user_password}
    Create API admin session
    ${response}    POST On Session    alias=${alias}    url=${user_url}    json=${body}    expected_status=400

    Dictionary Should Contain Key     ${response.json()}           error
    List Should Contain Value         ${response.json()}[error]    O campo e-mail é obrigatório.