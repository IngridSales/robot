*** Settings ***

Documentation           Ações do projeto

Resource                ${EXECDIR}/resources/base.robot


*** Keywords ***
Go To Page

    Go To           https://bodytest-web-drakke.herokuapp.com/

Acceso

    [Arguments]         ${email}        ${pass}
    Fill Text       css=#email          ${email}
    Fill Text       css=#password       ${pass}
    Click           css=button >> text=Entrar

Wait For Toast

    [Arguments]         ${txt_esperado}
    Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         5
    
Buscar Span Email Inválido

    [Arguments]         ${span_email_inv}     
    Get Text        css=span        contains        ${span_email_inv}

Buscar Span Senha Inválida

    [Arguments]         ${span_senha_inv}           
    Get Text        css=span        contains        ${span_senha_inv}

Clear Storage e Screenshot

    LocalStorage Clear
    Take Screenshot

Thinking and Screenshot

    [Arguments]         ${timeout}
    Sleep       ${timeout}
    Take Screenshot     

Span Campos Obrigatórios

    [Arguments]         ${span_email_obr}       ${span_senha_obr}

    Get Text        css=span >> text=${span_email_obr}
    Get Text       css=span >> text=${span_senha_obr}
