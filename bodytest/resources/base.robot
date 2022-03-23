*** Settings ***

Documentation       Base do Projeto

Library             Browser
Library             libs/IngridLibrary.py
Resource            ${EXECDIR}/resources/actions/login.robot
Resource            ${EXECDIR}/resources/actions/cad.robot
Resource            ${EXECDIR}/resources/actions/nav.robot

*** Keywords ***

Inicio de Sesión

    New Browser     chromium        false
    New Page        about:blank

Start Admin Session
    Inicio de Sesión
    Go To Page
    Acceso                          admin@bodytest.com          pwd123
    User Should Be Logged In        Administrador