*** Settings ***

Documentation           Ações do projeto - Cadastro

Resource                ${EXECDIR}/resources/base.robot

*** Keywords ***
cad.Go To Page

    Go To           https://bodytest-web-drakke.herokuapp.com/

cad.Acceso

    [Arguments]         ${email}            ${pass}
    Fill Text           css=#email          ${email}
    Fill Text           css=#password       ${pass}
    Click               css=button >> text=Entrar

cad.Wait For Toast

    [Arguments]                     ${txt_esperado}
    Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         10

Fill Cadastro

    [Arguments]         ${name}     ${email}    ${age}     ${weight}    ${feet_tall}
    Fill Text           css=input[placeholder="Digite seu nome completo"]           ${name}
    Fill Text           css=input[placeholder="Digite seu endereço de e-Mail"]      ${email}
    Fill Text           css=input[placeholder="Sua Idade"]                          ${age}
    Fill Text           css=input[placeholder="Seu Peso"]                           ${weight}
    Fill Text           css=input[placeholder="Sua Altura"]                         ${feet_tall}

Span Campos Obrigatório
    
    [Arguments]         ${span_name}    ${span_email}   ${span_age}     ${span_weight}      ${span_ft}         
    Get Text            css=span >> text=${span_name}
    Get Text            css=span >> text=${span_email} 
    Get Text            css=span >> text=${span_age}
    Get Text            css=span >> text=${span_weight}
    Get Text            css=span >> text=${span_ft}

Span Campo Obrigatório

    [Arguments]         ${span_obr}       
    Get Text            css=span >> text=${span_obr}

Clear Storage 

    LocalStorage Clear
    Take Screenshot