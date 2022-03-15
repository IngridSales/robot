*** Settings ***

Documentation           Ações do projeto

Resource                ${EXECDIR}/resources/base.robot


*** Keywords ***
Acceso

    [Arguments]         ${email}        ${pass}

    Fill Text       css=#email          ${email}
    Fill Text       css=#password       ${pass}
    Click           css=button >> text=Entrar

Buscar e Fechar Toast

    # [Arguments]         ${span_toast}
    [Arguments]         ${txt_esperado}
    Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         5
    # Get Text        xpath=//div[@class="Toastify"]      contains        ${span_toast}
    # Click           css=button >> text=✖︎
    
Buscar Span Email Inválido

    [Arguments]         ${span_email_inv}           

    Get Text        css=span        contains        ${span_email_inv}

Buscar Span Senha Inválida

    [Arguments]         ${span_senha_inv}           

    Get Text        css=span        contains        ${span_senha_inv}

Ir Para Pagina

    Go To           https://bodytest-web-drakke.herokuapp.com/

Clear Storage e Screenshot

    LocalStorage Clear
    Take Screenshot

Thinking and Screenshot

    [Arguments]         ${timeout}

    Sleep       ${timeout}
    Take Screenshot     