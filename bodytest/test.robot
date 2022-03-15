*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup          Inicio de Sesion
Test Teardown        Take Screenshot

*** Test Cases ***
Cenário: Email não cadastrado

    Go To Page
    Acceso           isalesmartins93@gmail.com          123123
    Wait For Toast
    ...         Usuário e/ou senha inválidos.
    [Teardown]  Thinking and Screenshot       2
    
Cenário: Entrar com um usuário cadastrado
    
    Go To Page
    Acceso           admin@bodytest.com       pwd123
    Get Text        css=div strong      contains        Administrador
    [Teardown]      Clear Storage e Screenshot

Cenário: Clicar em entrar sem preencher os campos

    Go To Page
    Acceso      ${EMPTY}        ${EMPTY}
    Span Campos Obrigatórios
    ...     A senha é obrigatória
    ...     O e-mail é obrigatório

Cenário: Clicar em entrar sem preencher o campo de email

    Go To Page
    Acceso      ${EMPTY}       pwd123
    Click           css=button >> text=Entrar
    Buscar Span Email Inválido         O e-mail é obrigatório

Cenário: Clicar em entrar sem preencher o campo de senha

    Go To Page
    Acceso        admin@bodytest.com           ${EMPTY}
    Click           css=button >> text=Entrar
    Buscar Span Senha Inválida          A senha é obrigatória

Cenário: Tentar entrar com um email inválido

    Go To Page
    Acceso          admin%bodytest.com          123123
    Buscar Span Email Inválido         Informe um e-mail válido

Cenário: Tentar entrar com uma senha inválida

    Go To Page
    Acceso           admin@bodytest.com       pwd
    Wait For Toast
    ...         Usuário e/ou senha inválidos.
    [Teardown]  Thinking and Screenshot       2







*** Keywords ***
# Acceso

#     [Arguments]         ${email}        ${pass}

#     Fill Text       css=#email          ${email}
#     Fill Text       css=#password       ${pass}
#     Click           css=button >> text=Entrar

# Buscar e Fechar Toast

#     [Arguments]         ${span_toast}

#     Get Text        xpath=//div[@class="Toastify"]      contains        ${span_toast}
#     Click           css=button >> text=✖︎
    
# Buscar Span Email Inválido

#     [Arguments]         ${span_email_inv}           

#     Get Text        css=span        contains        ${span_email_inv}

# Buscar Span Senha Inválida

#     [Arguments]         ${span_senha_inv}           

#     Get Text        css=span        contains        ${span_senha_inv}

# Span Campos Obrigatórios

#     [Arguments]         ${span_email_obr}       ${span_senha_obr}

#     Get Text        css=span >> text=${span_email_obr}
#     Get Text       css=span >> text=${span_senha_obr}



