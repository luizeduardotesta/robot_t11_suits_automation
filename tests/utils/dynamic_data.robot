*** Settings ***
Resource    ../../tests/utils/resources.robot

*** Keywords ***
Create user data
    ${random_word}          Generate Random String    length=8                                chars=[LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${USER_MAIL}             ${random_word}@qacoders.com.br
    Log                     ${USER_MAIL}  
    ${output}    Run    python -c "from cpf_generator import CPF; print(CPF.generate())"
    Set Test Variable    ${CPF}           ${output}
    Log                  ${output}

Create company data
    ${generate_cnpj}        Generate Random String    14    [NUMBERS]
    Log                     ${generate_cnpj}
    Set Test Variable       ${CNPJ}                   ${generate_cnpj}
    ${random_word}          Generate Random String    8     [LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${COMPANY_MAIL}           ${random_word}@qacoders.com.br
    Log                     ${COMPANY_MAIL}