*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


*** Test Cases ***
Cenario: Novo Aluno
    &{student}          Create Dictionary       name=Josevaldo da Silva       email=josevaldo@gmail.com        age=56      weight=77       feet_tall=1.73
    Remove Student          ${student.email}
    Go To Students
    Go To Form Students
    New Student             ${student}
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

# Cenário: Cadastrar novo aluno com sucesso
#     &{student}          Create Dictionary       name=Juninho da Silva       email=juninho@gmail.com        age=56               weight=77       feet_tall=1.73
#     Go To Students
#     Go To Form Students
#     New Student             ${student}
#     Wait For Toast          Aluno cadastrado com sucesso.
#     [Teardown]              Thinking and Screenshot         2

Cenário: Enviar formulário vazio       
    &{SPAN}         Create Dictionary       sname=Nome é obrigatório        semail=O e-mail é obrigatório       sage=idade é obrigatória        sweight=o peso é obrigatório        sheight=a Altura é obrigatória

    Go To Students
    Go To Form Students
    Click Save
    Span Campos Obrigatório         ${SPAN}
    [Teardown]                      Thinking and Screenshot         2

# Cenário: Tentar cadastrar novo aluno "sem nome"

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     ${EMPTY}
#     ...     test@gmail.com
#     ...     56
#     ...     77
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          Nome é obrigatório
#     [Teardown]      Clear Storage

# Cenário: Tentar cadastrar novo aluno "sem email"

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     ${EMPTY}
#     ...     56
#     ...     77
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          O e-mail é obrigatório
#     [Teardown]      Clear Storage

# Cenário: Tentar cadastrar novo aluno "sem idade"

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test@gmail.com
#     ...     ${EMPTY}
#     ...     77
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          idade é obrigatória
#     [Teardown]      Clear Storage

# Cenário: Tentar cadastrar novo aluno "sem peso"

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test@gmail.com
#     ...     56
#     ...     ${EMPTY}
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          o peso é obrigatório
#     [Teardown]      Clear Storage

# Cenário: Tentar cadastrar novo aluno "sem altura"

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test@gmail.com
#     ...     56
#     ...     77
#     ...     ${EMPTY}
#     Click Save
#     Span Campo Obrigatório          a Altura é obrigatória
#     [Teardown]      Clear Storage

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


# Cenário: Tentar cadastrar usuário pré-histórico

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test@gmail.com
#     ...     5089
#     ...     77
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          A idade deve ser menor ou igual 150 anos
#     [Teardown]      Clear Storage

# Cenário: Tentar cadastrar usuário bebê

#     Click navbar                    /alunos
#     Click navbar                    /alunos/new
#     Fill Cadastro
#     ...     Test
#     ...     test@gmail.com
#     ...     2
#     ...     77
#     ...     1.73
#     Click Save
#     Span Campo Obrigatório          A idade deve ser maior ou igual 14 anos
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
