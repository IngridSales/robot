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
