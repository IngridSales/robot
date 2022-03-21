*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup          Inicio de Sesión


*** Test Cases ***

Cenário: Cadastrar novo aluno com sucesso

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click Save
    cad.Wait For Toast          Aluno cadastrado com sucesso.
    [Teardown]      Clear Storage

Cenário: Enviar formulário vazio       

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    Click Save
    Span Campos Obrigatório      
    ...     Nome é obrigatório
    ...     O e-mail é obrigatório
    ...     idade é obrigatória
    ...     o peso é obrigatório
    ...     a Altura é obrigatória
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem nome"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     ${EMPTY}
    ...     test@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click Save
    Span Campo Obrigatório          Nome é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem email"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     ${EMPTY}
    ...     56
    ...     77
    ...     1.73
    Click Save
    Span Campo Obrigatório          O e-mail é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem idade"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     ${EMPTY}
    ...     77
    ...     1.73
    Click Save
    Span Campo Obrigatório          idade é obrigatória
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem peso"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     56
    ...     ${EMPTY}
    ...     1.73
    Click Save
    Span Campo Obrigatório          o peso é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem altura"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     56
    ...     77
    ...     ${EMPTY}
    Click Save
    Span Campo Obrigatório          a Altura é obrigatória
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno com email inválido

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test$gmail.com
    ...     56
    ...     77
    ...     1.73
    Click Save
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar com usuário já existente

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click Save
    cad.Wait For Toast              Email já existe no sistema.
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar usuário pré-histórico

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     5089
    ...     77
    ...     1.73
    Click Save
    Span Campo Obrigatório          A idade deve ser menor ou igual 150 anos
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar usuário bebê

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Click navbar                    /alunos/new
    Fill Cadastro
    ...     Test
    ...     test@gmail.com
    ...     2
    ...     77
    ...     1.73
    Click Save
    Span Campo Obrigatório          A idade deve ser maior ou igual 14 anos
    [Teardown]      Clear Storage

# Cenário: Editar cadastro de aluno

#     cad.Go To Page
#     cad.Acceso          admin@bodytest.com          pwd123
#     Click navbar                    /alunos
#     Fill Searchbox                  Test
#     Click edit or trash             .edit


Cenário: Remover cadastro de aluno

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click navbar                    /alunos
    Fill Searchbox                  Test
    Wait For Elements State         xpath=//tr//td[text()="Test"]         visible         5
    Click                           css=#trash
    Click                           css=button >> text=SIM, pode apagar!
    cad.Wait For Toast              Aluno removido com sucesso.
    [Teardown]      Clear Storage
