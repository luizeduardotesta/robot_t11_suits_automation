*** Settings ***
Documentation    Projects main file
Library          SeleniumLibrary
Library          String
Resource         ./actions/signup.resource

*** Keywords ***
Start Session
    Open Browser    ${login_url}    browser=${browser}    

    Wait Until Element Is Visible    ${loginText}