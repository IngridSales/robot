*** Settings ***

Documentation           Ações do projeto - Cadastro

*** Keywords ***
Get Register Not Found

    [Arguments]        ${name_nf}
    Fill Text          css=input[placeholder^="Buscar"]         ${name_nf}
    Get Text           xpath=//div[text()="Nenhum registro encontrado."]

Confirm Remove

    Click               xpath=//span[text()=" Apagar"]
    Get Text            xpath=//div//h2[text()="Você está certo disso?"]
    Click               xpath=//div//button[text()="SIM, pode apagar!"]
    Wait For Toast      Aluno removido com sucesso.

Cancel Remove

    Click               xpath=//span[text()=" Apagar"]
    Get Text            xpath=//div//h2[text()="Você está certo disso?"]
    Click               xpath=//div//button[text()="NÃO"]


Check Type Field On Student Form

    [Arguments]     ${element}      ${type}
    Go To Students
    Go To Form Students
    Field Should Be Type  ${element}  ${type}

Field Should Be Type

    [Arguments]         ${element}          ${type}
    ${attr}             Get Attribute       ${element}     type
    Should Be Equal     ${attr}             ${type}

Go To Form Students

    Click                           xpath=//a[@href="/alunos/new"]
    Wait For Elements State         h1 >> text=Novo aluno           visible         5

New Student

    [Arguments]         ${student}        
    Fill Text           css=input[name="name"]          ${student.name}
    Fill Text           css=input[name=email]           ${student.email}
    Fill Text           css=input[name=age]             ${student.age}
    Fill Text           css=input[name=weight]          ${student.weight}
    Fill Text           css=input[name=feet_tall]       ${student.feet_tall}
    Submit Form

Get Span   

    [Arguments]     ${msg}
    ${element}      Set Variable        xpath=//span[text()^="${msg}"]

Fill Searchbox

    [Arguments]         ${search}
    Fill Text               css=input[placeholder^="Buscar"]        ${search}
    Wait For Elements State        xpath=//tr//td[2]          visible         5

Clear Storage and Screenshot

    LocalStorage Clear
    Take Screenshot

Get Required Alerts

    [Arguments]     ${index}
    ${span}         Get Text            xpath=(//form//span)[${index}]
    [return]        ${span}

Search Student By Name
    [Arguments]         ${name}
    Fill Text           css=input[placeholder="Buscar aluno"]           ${name}

Go To Student Update Form
    [Arguments]                 ${email}
    Click                       xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State     css=h1 >> text=Edição de aluno              visible             5

Update A Student
    [Arguments]         ${student}        
    Fill Text           ${NAME_FIELD}            ${student['name']}
    Fill Text           ${EMAIL_FIELD}           ${student['email']}
    Fill Text           ${AGE_FIELD}             ${student['age']}
    Fill Text           ${WEIGHT_FIELD}          ${student['weight']}
    Fill Text           ${FEET_TALL_FIELD}       ${student['feet_tall']}
    Submit Form

Student Name Should Be Visible
    [Arguments]                     ${name}
    Wait For Elements State         css=table tbody tr >> text=${name}              Visible         5

