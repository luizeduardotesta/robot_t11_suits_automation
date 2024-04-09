*** Settings ***
Documentation    Faker CPF
Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Library      FakerLibrary    locale=pt_BR
Library      cpf_generator

#Variables
Variables    ./data/test_data.yaml

#Resources
Resource    ./data/dynamic_data.robot
Resource    ../board/create_board/create_board.resource
Resource    ../board/list_board/list_board.resource
Resource    ../board/update_board/update_board.resource
#Resource    ../board/delete_board/delete_board.resource
Resource    ../company/create_company/create_company.resource
Resource    ../company/list_company/list_company.resource
Resource    ../company/update_company/update_company.resource
Resource    ../company/delete_company/delete_company.resource
Resource    ../login/auth_sysadmin.resource
Resource    ../login/auth_common.resource
Resource    ../user/create_user/create_user.resource
Resource    ../user/list_user/list_user.resource
Resource    ../user/update_user/update_user.resource
Resource    ../user/delete_user/delete_user.resource
