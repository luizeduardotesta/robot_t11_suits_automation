*** Settings ***
Documentation    Projects main file
Library          SeleniumLibrary
Library          String
Resource         ./actions/signup.resource

*** Keywords ***
Start Session
    Open Browser    https://automacao.qacoders-academy.com.br    browser=${browser}    

    Wait Until Element Is Visible    //h3[contains(.,'Login')]