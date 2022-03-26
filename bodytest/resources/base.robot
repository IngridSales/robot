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

*** Keywords ***

Inicio de Sesión

    New Browser     chromium        true
    New Page        about:blank

Start Admin Session
    Inicio de Sesión
    Go To Page
    Acceso                          admin@bodytest.com          pwd123
    User Should Be Logged In        Administrador
