*** Settings ***

Documentation       Base do Projeto

Library             Browser
Resource            ${EXECDIR}/resources/actions/login.robot


*** Keywords ***

Inicio de Sesion

    New Browser     chromium        false
    New Page        about:blank