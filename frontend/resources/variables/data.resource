*** Settings ***
Documentation    Projects main file
Library          SeleniumLibrary
Library          String

*** Keywords ***
Create user data
    ${random_word}              Generate Random String    length=8          chars=[LETTERS]
    ${random_word}              Convert to lower case     ${random_word}
    Set Test Variable           ${USER_MAIL}              ${random_word}@qacoders.com.br
    Log                         ${USER_MAIL}  
    ${generate_cpf}             Generate Random String    11    [NUMBERS]
    Set Test Variable           ${CPF}                    ${generate_cpf}
    Log                         ${CPF}

*** Variables ***
#URL data
${browser}                   chrome
${login_url}                 https://automacao.qacoders-academy.com.br/login
${home_url}                  https://automacao.qacoders-academy.com.br/home

#Login data
${loginText}                 //h3[contains(.,'Login')]
${loginButton}               //button[contains(@id,'login')]
${adminMailInput}            //input[contains(@id,'email')]
${passwordInput}             //input[contains(@id,'password')]

#Home data
${cadastroList}              //div[contains(@id,'Cadastros')]
${usuariosList}              //div[contains(@id,'Usuários')]
${novoCadastroButton}        //button[contains(@id,'Novo Cadastro')]
${fullNameInput}             //input[contains(@name,'fullName')]
${userMailInput}             //input[contains(@id,'mail')]
${accessProfileInput}        //input[contains(@id,'accessProfile')]
${cpfInput}                  //input[contains(@id,'cpf')]
${confirmPasswordInput}      //input[contains(@id,'confirmPassword')]
${saveButton}                //button[contains(@id,'save')]

${logoutButton}              //button[@class='css-1nvbq2d'][contains(.,'Logout')]
${homeIcon}                  //a[contains(@id,'home')]

${nextPageButton}            //button[@class='css-kab9pu']
${previousPageButton}        //button[@id='backButton']
${paginationNext}            (//div[contains(.,'31-60 de 688')])[5]
${paginationPrevious}        (//div[contains(.,'1-30 de 688')])[5]


#User data
${fullName}           Luiz Testa 
${accessProfile}      ADMIN
${password}           Test@1234
${confirmPassword}    Test@1234 