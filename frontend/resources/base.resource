*** Settings ***
Documentation    Projects main file
Library          SeleniumLibrary
Library          String
Resource         ./actions/login_page.resource
Resource         ./actions/home_page.resource

*** Keywords ***
Start Session
    Open Browser    ${login_url}    browser=${browser}    

    Wait Until Element Is Visible    ${loginText}