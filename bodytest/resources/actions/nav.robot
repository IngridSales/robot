*** Settings    ***
Documentation           Ações do menu superior de navegação

*** Keywords ***
Go To Students
    Click                           css=a[href$="/alunos"]
    Wait For Elements State         h1 >> text=Gestão de Alunos         visible         5

User Should Be Logged In
    [Arguments]     ${user_name}
    Get Text        css=strong        should be       ${user_name}

Submit Form
    Click               xpath=//button[text()="Salvar"]