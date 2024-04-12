*** Settings ***
Resource    ../resources.robot

*** Keywords ***
Create user data
    ${random_word}          Generate Random String    length=8          chars=[LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${USER_MAIL}             ${random_word}@qacoders.com.br
    Log                     ${USER_MAIL}  

Create company data
    ${random_word}          Generate Random String    8     [LETTERS]
    ${random_word}          Convert to lower case     ${random_word}
    Set Test Variable       ${COMPANY_MAIL}           ${random_word}@qacoders.com.br
    Log                     ${COMPANY_MAIL}

Create board data         
    ${boardName}            Generate Random String    length=16          chars=[LETTERS]
    Set Test Variable       ${BOARD_NAME}             ${boardName}
    Log                     ${BOARD_NAME}  