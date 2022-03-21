*** Settings ***

Documentation       Base do Projeto

Library             Browser
Resource            ${EXECDIR}/resources/actions/login.robot
Resource            ${EXECDIR}/resources/actions/cad.robot

*** Keywords ***

Inicio de Sesión

    New Browser     chromium        false
    New Page        about:blank