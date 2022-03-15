*** Settings ***

Documentation       Base do Projeto

Library             Browser
# Resource            ${EXECDIR}/resources/test.robot
Resource            ${EXECDIR}/resources/actions/actions.robot


*** Keywords ***

Inicio de Sesion

    New Browser     chromium        false
    New Page        about:blank