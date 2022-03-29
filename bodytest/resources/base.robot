*** Settings ***

Documentation       Base do Projeto

Library             Browser
Library             OperatingSystem
Library             Collections
Library             String
Library             libs/IngridLibrary.py
Resource            ${EXECDIR}/resources/actions/login.robot
Resource            ${EXECDIR}/resources/actions/student.robot
Resource            ${EXECDIR}/resources/actions/nav.robot

*** Variables ***
${NAME_FIELD}         css=input[name=name]
${EMAIL_FIELD}        css=input[name=email]
${AGE_FIELD}          css=input[name=age]
${WEIGHT_FIELD}       css=input[name=weight]
${FEET_TALL_FIELD}    css=input[name=feet_tall]


*** Keywords ***

Inicio de Sesión

    New Browser     chromium        false
    New Page        about:blank

Start Admin Session
    Inicio de Sesión
    Go To Page
    Acceso                          admin@bodytest.com          pwd123
    User Should Be Logged In        Administrador
