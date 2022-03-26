*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


*** Test Cases ***
Cenário: Novo Aluno
    

    # &{student}          Create Dictionary       name=Josevaldo da Silva       email=josevaldo@gmail.com        age=56      weight=77       feet_tall=1.73

    ${json}         Get File        resources/fixtures/cad.json
    ${aluno}      Evaluate        json.loads($json)       json

    Remove Student          ${aluno['new']['email']}
    Go To Students
    Go To Form Students
    New Student             ${aluno}
    Wait For Toast          Aluno cadastrado com sucesso.
    [Teardown]              Thinking and Screenshot         2

Cenário: Não deve permitir email duplicado

    &{student}          Create Dictionary       name=Juninho da Silva       email=juninho@gmail.com        age=56      weight=77       feet_tall=1.73

    Insert Student          ${student}
    Go To Students
    Go To Form Students
    New Student             ${student}
    Wait For Toast          Email já existe no sistema.
    [Teardown]              Thinking and Screenshot         2

Cenário: Todos os campos devem ser obrigatórios
    [tags]          alertas
    @{expected_alerts}          Set Variable        Nome é obrigatório      O e-mail é obrigatório      idade é obrigatória     o peso é obrigatório        a Altura é obrigatória
    @{got_alerts}               Create List
    Go To Students
    Go To Form Students
    Submit Form

        FOR     ${index}        IN RANGE        1       6
            ${span}             Get Required Alerts     ${index}
            Append To List      ${got_alerts}           ${span}
        END
    Log                         ${expected_alerts}
    Log                         ${got_alerts}
    Lists Should Be Equal       ${expected_alerts}          ${got_alerts}

Cenário: Validação dos campos numéricos
    
    [Template]      Check Type Field On Student Form
    ${AGE_FIELD}        number
    ${WEIGHT_FIELD}     number
    ${FEET_TALL_FIELD}  number

Cenário: Validar campo do tipo email
    [tags]          field
    [Template]      Check Type Field On Student Form
    ${EMAIL_FIELD}      email

Cenário: Menor de 14 anos não pode fazer cadastro

*** Variables ***
${NAME_FIELD}         css=input[name=name]
${EMAIL_FIELD}        css=input[name=email]
${AGE_FIELD}          css=input[name=age]
${WEIGHT_FIELD}       css=input[name=weight]
${FEET_TALL_FIELD}    css=input[name=feet_tall]

*** Keywords ***
Check Type Field On Student Form
    [Arguments]     ${element}      ${type}
    Go To Students
    Go To Form Students
    Field Should Be Type  ${element}  ${type}

Field Should Be Type
    [Arguments]         ${element}          ${type}
    ${attr}             Get Attribute       ${element}     type
    Should Be Equal     ${attr}             ${type}

# Cenário: Enviar formulário vazio

#     Go To Students
#     Go To Form Students
#     Submit Form Empty       
#     [Teardown]                      Thinking and Screenshot         2


# Cenário: Tentar cadastrar novo aluno com email inválido

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test$gmail.com
#     ...     56
#     ...     77
#     ...     1.73
#     Click Save
#     [Teardown]      Clear Storage



# # Cenário: Editar cadastro de aluno

# #     cad.Go To Page
# #     cad.Acceso          admin@bodytest.com          pwd123
# #     Click navbar                    /alunos
# #     Fill Searchbox                  Test
# #     Click edit or trash             .edit


# Cenário: Remover cadastro de aluno

#     Click navbar                    /alunos
#     Fill Searchbox                  Test
#     Wait For Elements State         xpath=//tr//td[text()="Test"]         visible         5
#     Click                           css=#trash
#     Click                           css=button >> text=SIM, pode apagar!
#     cad.Wait For Toast              Aluno removido com sucesso.
#     [Teardown]      Clear Storage
