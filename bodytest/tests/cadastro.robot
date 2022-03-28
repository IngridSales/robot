*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


*** Test Cases ***
Cenário: Novo Aluno
    # [tags]      temp

    &{student}          Create Dictionary       name=Josevaldo da Silva       email=josevaldo@gmail.com        age=56      weight=77       feet_tall=1.73

    # ${json}         Get File        resources/fixtures/student.json
    # ${aluno}      Evaluate        json.loads($json)       json

    Remove Student          ${student.email}
    Go To Students
    Go To Form Students
    New Student             ${student}
    Wait For Toast          Aluno cadastrado com sucesso.
    [Teardown]              Thinking and Screenshot         2

Cenário: Não deve permitir email duplicado
    # [tags]      temp

    &{student}          Create Dictionary       name=Juninho da Silva       email=juninho@gmail.com        age=56      weight=77       feet_tall=1.73

    # ${json}         Get File        resources/fixtures/student.json
    # ${duplic}      Evaluate        json.loads($json)       json

    Insert Student          ${student}
    Go To Students
    Go To Form Students
    New Student             ${student}
    Wait For Toast          Email já existe no sistema.
    [Teardown]              Thinking and Screenshot         2

Cenário: Todos os campos devem ser obrigatórios
    
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

    [Template]      Check Type Field On Student Form
    ${EMAIL_FIELD}      email

Cenário: Menor de 14 anos não pode fazer cadastro
    # [tags]      temp

    &{student}          Create Dictionary       name=Jubileu da Silva       email=jubileu@gmail.com        age=13      weight=77       feet_tall=1.73

    
    Remove student          ${student.email}
    Go To Students
    Go To Form Students
    New Student             ${student}
    Get Span                    
   
    [Teardown]              Thinking and Screenshot         2


# Cenário: Tentar cadastrar novo aluno com email inválido




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





# *** Variables ***
# ${NAME_FIELD}         css=input[name=name]
# ${EMAIL_FIELD}        css=input[name=email]
# ${AGE_FIELD}          css=input[name=age]
# ${WEIGHT_FIELD}       css=input[name=weight]
# ${FEET_TALL_FIELD}    css=input[name=feet_tall]
