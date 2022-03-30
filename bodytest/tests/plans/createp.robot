*** Settings ***
Documentation           Remover alunos
Resource                ${EXECDIR}/resources/base.robot
Suite Setup             Start Admin Session
Test Teardown           Take Screenshot

*** Test Case ***
Cenário: Novo plano
   [tags]      temp
    &{plans}        Create Dictionary       title=Plano A       duration=12         price=10,00

    Remove Plan             ${plans.title}
    Go To Plans             
    Go To Form Plans        
    New Plan                ${plans}
    Wait For Toast          Plano cadastrado com sucesso
    [Teardown]              Thinking and Screenshot         2

Cenário: Validação dos campos numericos
     [tags]      temp
    [Template]      Check Type Field On Plans Form
    ${PRICE_FIELD}      number

Cenário: Tiulo e Duração devem ser obrigatórios
    [tags]      temp
    @{alerts}       Set Variable        Informe o título do plano       Informe a duração do plano em meses         
    @{got_alerts}       Create List
    Go To Plans             
    Go To Form Plans
    Submit Form

        FOR     ${index}        IN RANGE        1       3
            ${span}             Get Required Alerts     ${index}
            Append To List      ${got_alerts}           ${span}
        END
    Log                         ${alerts}
    Log                         ${got_alerts}
    Lists Should Be Equal       ${alerts}          ${got_alerts}
    [Teardown]              Thinking and Screenshot         2

Cenário: A duração do plano deve ser no máximo 60 meses
    [tags]      temp
    &{plans}        Create Dictionary       title=Plano B       duration=61         price=10,00

    Remove Plan             ${plans.title}
    Go To Plans             
    Go To Form Plans        
    New Plan                ${plans}
    Get Span                A duração dever ser no máximo 60 meses
    [Teardown]              Thinking and Screenshot         2

Cenário: Calcular o preço total do plano
    

Cenário: O preço mensal deve ser menor que 100.000.000,00
    [tags]      temp
    &{plans}        Create Dictionary       title=Plano C       duration=4         price=100.000.000,00

    Remove Plan             ${plans.title}
    Go To Plans             
    Go To Form Plans        
    New Plan                ${plans}
    Wait For Toast          Erro cadastrar aluno!
    [Teardown]              Thinking and Screenshot         2
Cenário: O preço deve ser obrigatório e maior que zero
    [tags]      temp
    &{plans}        Create Dictionary       title=Plano D      duration=4         price=0,00

    Remove Plan             ${plans.title}
    Go To Plans             
    Go To Form Plans        
    New Plan                ${plans}
    Wait For Toast          O valor do plano deve ser maior que zero!
    [Teardown]              Thinking and Screenshot         2

Cenário: A duração do plano deve ser no minimo 1 mês
    [tags]      temp
    &{plans}        Create Dictionary       title=Plano E       duration=-1         price=10,00

    Remove Plan             ${plans.title}
    Go To Plans             
    Go To Form Plans        
    New Plan                ${plans}
    Get Span                A duração dever ser no mínimo 1 mês
    [Teardown]              Thinking and Screenshot         2

