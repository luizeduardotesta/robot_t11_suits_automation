*** Settings ***
Documentation
Library      RequestsLibrary
Library      String
Library      Collections
Library      OperatingSystem
Library      cpf_generator

#Variables
Variables    ../../resources/test_data/test_data.yaml

#Resources
Resource    ../../resources/companys_tests.resource
Resource    ../../resources/users_tests.resource
Resource    ../../resources/login/auth_sysadmin.resource
Resource    ../../resources/login/auth_common.resource
Resource    dynamic_data.robot
