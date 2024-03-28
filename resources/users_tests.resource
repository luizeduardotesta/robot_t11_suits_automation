*** Settings ***
Documentation
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    cpf_generator
Variables    test_data/test_data.yaml

*** Keywords ***
Create API session
    ${headers}        Create Dictionary    accepet=application/json                      Content-Type=application/json    Authorization=${TOKEN}
    Create Session    alias=APIsuits       url=https://suits.qacoders-academy.com.br/    headers=${headers}

Login with admin
    ${body}    Create Dictionary    mail=${admin_mail}    password=${admin_password}
    Log                  ${body}
    Create API session
    ${response}    POST On Session    alias=APIsuits    url=/api/login/    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${TOKEN}              ${response.json()["token"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}
    Log    ${TOKEN}

Create user data
    ${random_word}          Generate Random String    length=8                                chars=[LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${MAIL_TEST}             ${random_word}@qacoders.com.br
    Log                     ${MAIL_TEST} 
    ${output}    Run    python -c "from cpf_generator import CPF; print(CPF.generate())"
    Set Test Variable    ${CPF}           ${output}
    Log    CPF: ${output}  

Create a new ususer
    ${body}              Create Dictionary     fullName=Luiz Testa          mail=${MAIL_TEST}    password=1234@Test    accessProfile=ADMIN    cpf=${CPF}    confirmPassword=1234@Test 
    Log                  ${body}
    Create API session
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
    Dictionary Should Contain Item    ${GET_RESPONSE}    mail    ${MAIL_TEST} 
    Dictionary Should Contain Item    ${GET_RESPONSE}    cpf    ${CPF}
    Dictionary Should Contain Item    ${GET_RESPONSE}    _id    ${USER_ID}