*** Settings ***

Documentation       Base do Projeto

Library             Browser
Resource            ${EXECDIR}/resources/test.robot



*** Keywords ***

Inicio de Sesion

    New Browser     chromium        false
    New Page        https://bodytest-web-drakke.herokuapp.com/