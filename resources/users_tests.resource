*** Settings ***
Documentation
Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Library      cpf_generator
Variables    test_data/test_data.yaml

*** Keywords ***
Create API admin session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${ADMIN_TOKEN}    
    Create Session    alias=APIsuits       url=https://suits.qacoders-academy.com.br/    headers=${headers}    disable_warnings=${true}

Login with admin
    ${body}    Create Dictionary    mail=${admin_mail}    password=${admin_password}
    Log                  ${body}
    Create API admin session
    ${response}    POST On Session    alias=APIsuits    url=/api/login/    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${ADMIN_TOKEN}              ${response.json()["token"]}
    Log    ${ADMIN_TOKEN}

Create API user session
    ${headers}        Create Dictionary    accepet=application/json       Content-Type=application/json    Authorization=${USER_TOKEN}    
    Create Session    alias=APIsuits       url=https://suits.qacoders-academy.com.br/    headers=${headers}    disable_warnings=${true}

Login with user
    ${body}    Create Dictionary    mail=${USER_MAIL}    password=1234@Test
    Log                  ${body}
    Create API user session
    ${response}    POST On Session    alias=APIsuits    url=/api/login/    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${USER_TOKEN}              ${response.json()["token"]}
    Log    ${USER_TOKEN}

Create user data
    ${random_word}          Generate Random String    length=8                                chars=[LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${USER_MAIL}             ${random_word}@qacoders.com.br
    Log                     ${USER_MAIL} 
    ${output}    Run    python -c "from cpf_generator import CPF; print(CPF.generate())"
    Set Test Variable    ${CPF}           ${output}
    Log    CPF: ${output}  

Create a new user
    ${body}              Create Dictionary     fullName=Luiz Testa          mail=${USER_MAIL}    password=1234@Test    accessProfile=ADMIN    
    ...    cpf=${CPF}    confirmPassword=1234@Test 
    Log                  ${body}
    Create API admin session
    ${response}          POST On Session       alias=APIsuits          url=/api/user/          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${USER_ID}            ${response.json()["user"]["_id"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}

Check if the new user was created
    Log                               ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    msg    Olá Luiz Testa, cadastro realizado com sucesso.
    Dictionary Should Contain key     ${RESPONSE}[user]    _id

List the created user
    ${get_response}    GET On Session    alias=APIsuits          url=/api/user/${USER_ID}      expected_status=200
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the created user data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    Luiz Testa
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}
    Dictionary Should Contain Item    ${GET_RESPONSE}    cpf         ${CPF}
    Dictionary Should Contain Item    ${GET_RESPONSE}    _id         ${USER_ID}

Update the created user fullName and mail
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${update_user_fullname}    PUT On Session       alias=APIsuits     url=/api/user/${USER_ID}    expected_status=200    headers=${headers}    
    ...    data={"fullName":"Luiz Eduardo", "mail":"${USER_MAIL}"}

List the updated user
    ${headers}    Create Dictionary    Authorization=${USER_TOKEN}
    ${get_response}    GET On Session    alias=APIsuits          url=/api/user/${USER_ID}      expected_status=200    headers=${headers}
    Set Task Variable    ${GET_RESPONSE}    ${get_response.json()}

Check the updated user data
    Log    ${GET_RESPONSE}
    Dictionary Should Contain Item    ${GET_RESPONSE}    fullName    Luiz Eduardo
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail        ${USER_MAIL}

Delete the created user
    ${headers}    Create Dictionary    Authorization=${ADMIN_TOKEN}
    ${delete_user}    DELETE On Session       alias=APIsuits     url=/api/user/${USER_ID}    expected_status=200    headers=${headers}
    Set Test Variable    ${DELETE_RESPONSE}    ${delete_user.json()} 

Check if the user was deleted
    Log    ${DELETE_RESPONSE}
    Dictionary Should Contain Item    ${DELETE_RESPONSE}    msg    Usuário deletado com sucesso!.