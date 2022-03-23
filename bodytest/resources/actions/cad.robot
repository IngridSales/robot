*** Settings ***

Documentation           Ações do projeto - Cadastro

*** Keywords ***
Go To Form Students
    Click                           css=a[href$="/alunos/new"]
    Wait For Elements State         h1 >> text=Novo aluno           visible         5

cad.Wait For Toast

    [Arguments]                     ${txt_esperado}
    Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         3

New Student
    [Arguments]         ${student}
    Fill Text           css=input[name=name]            ${student.name}
    Fill Text           css=input[name=email]           ${student.email}
    Fill Text           css=input[name=age]             ${student.age}
    Fill Text           css=input[name=weight]          ${student.weight}
    Fill Text           css=input[name=feet_tall]       ${student.feet_tall}
    Submit Form

Span Campos Obrigatório
    
    [Arguments]         ${SPAN}             
    Get Text            css=span >> text=Nome é obrigatório             ${SPAN.sname}
    Get Text            css=span >> text=O e-mail é obrigatório         ${SPAN.semail}
    Get Text            css=span >> text=idade é obrigatória            ${SPAN.sage}
    Get Text            css=span >> text=o peso é obrigatório           ${SPAN.sweight}
    Get Text            css=span >> text=a Altura é obrigatória         ${SPAN.sheight}

Span Campo Obrigatório

    [Arguments]         ${span_obr}       
    Get Text            css=span >> text=${span_obr}

Fill Searchbox

    [Arguments]             ${search}
    Fill Text               css=input[placeholder^="Buscar"]        ${search}

# Click navbar

#     [Arguments]             ${al_pl_ma}
#     Click                   xpath=//a[@href="${al_pl_ma}"]



Clear Storage 

    LocalStorage Clear
    Take Screenshot