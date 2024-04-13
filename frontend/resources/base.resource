*** Settings ***
Documentation    Projects main file
Library          SeleniumLibrary
Library          String
Resource         ./actions/login_page.resource
Resource         ./actions/home_page.resource
Resource         ./actions/user_page.resource

*** Keywords ***
Start Session
    Open Browser    ${login_url}    browser=${browser}
    Maximize Browser Window    
    Wait Until Element Is Visible    ${loginText}