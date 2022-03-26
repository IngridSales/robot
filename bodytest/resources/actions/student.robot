*** Settings ***

Documentation           Ações do projeto - Cadastro

*** Keywords ***
Submit Form Empty

    Submit Form
    Get Text            css=span >> text=Nome é obrigatório             
    Get Text            css=span >> text=O e-mail é obrigatório         
    Get Text            css=span >> text=idade é obrigatória            
    Get Text            css=span >> text=o peso é obrigatório           
    Get Text            css=span >> text=a Altura é obrigatória    
 
Go To Form Students
    Click                           xpath=//a[@href="/alunos/new"]
    Wait For Elements State         h1 >> text=Novo aluno           visible         5

# cad.Wait For Toast

#     [Arguments]                     ${txt_esperado}
#     Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         3

New Student

    [Arguments]         ${aluno}
    Fill Text           css=input[id="name"]            ${aluno["new"]["name"]}
    Fill Text           css=input[name=email]           ${aluno["new"]["email"]}
    Fill Text           css=input[name=age]             ${aluno["new"]["age"]}
    Fill Text           css=input[name=weight]          ${aluno["new"]["weight"]}
    Fill Text           css=input[name=feet_tall]       ${aluno["new"]["feet_tall"]}
    Submit Form

Span Campo Obrigatório

    [Arguments]         ${span_obr}       
    Get Text            css=span >> text=${span_obr}

Fill Searchbox

    [Arguments]             ${search}
    Fill Text               css=input[placeholder^="Buscar"]        ${search}

Clear Storage 

    LocalStorage Clear
    Take Screenshot

Get Required Alerts
    [Arguments]     ${index}
    ${span}         Get Text            xpath=(//form//span)[${index}]
    [return]        ${span}

