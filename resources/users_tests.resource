*** Settings ***
Documentation
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    cpf_generator

*** Keywords ***
Create API session
    ${headers}        Create Dictionary    accepet=application/json                      Content-Type=application/json    Authorization=${token}
    Create Session    alias=APIsuits       url=https://suits.qacoders-academy.com.br/    headers=${headers}

Login with admin
    ${body}    Create Dictionary    mail=sysadmin@qacoders.com    password=1234@Test
    Log                  ${body}
    Create API session
    ${response}    POST On Session    alias=APIsuits    url=/api/login/    json=${body}    expected_status=200
    Log    ${response.json()}
    Set Test Variable    ${token}              ${response.json()["token"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}
    Log    ${token}

Create user data
    ${random_word}          Generate Random String    length=8                                chars=[LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${EMAIL_TEST}             ${random_word}@qacoders.com.br
    Log                     ${EMAIL_TEST} 

Generate CPF
    ${output}    Run    python -c "from cpf_generator import CPF; print(CPF.generate())"
    Set Test Variable    ${cpf}           ${output}
    Log    CPF: ${output}

Create a new ususer
    ${body}              Create Dictionary     fullName=Luiz Testa          mail=${EMAIL_TEST}    password=1234@Test    accessProfile=ADMIN    cpf=${cpf}    confirmPassword=1234@Test 
    Log                  ${body}
    Create API session
    ${response}          POST On Session       alias=APIsuits          url=/api/user/          json=${body}    expected_status=201
    Log                  ${response.json()}
    Set Test Variable    ${ID_USUARIO}         ${response.json()["user"]["_id"]}
    Set Test Variable    ${RESPONSE}           ${response.json()}

Check if the new user was created
    Log                               ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    msg    Olá Luiz Testa, cadastro realizado com sucesso.
    Dictionary Should Contain key     ${RESPONSE}[user]    _id

