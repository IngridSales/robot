*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Suite Setup          Inicio de Sesion
Test Setup           Take Screenshot

*** Test Cases ***

Cenário: Cadastrar novo aluno com sucesso

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    cad.Wait For Toast          Aluno cadastrado com sucesso.
    [Teardown]      Clear Storage

Cenário: Enviar formulário vazio       

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     ${EMPTY}
    Click               xpath=//button[text()="Salvar"]
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
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     ${EMPTY}
    ...     tonyzinho@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    Span Campo Obrigatório          Nome é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem email"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     ${EMPTY}
    ...     56
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    Span Campo Obrigatório          O e-mail é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem idade"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho@gmail.com
    ...     ${EMPTY}
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    Span Campo Obrigatório          idade é obrigatória
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem peso"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho@gmail.com
    ...     56
    ...     ${EMPTY}
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    Span Campo Obrigatório          o peso é obrigatório
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno "sem altura"

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho@gmail.com
    ...     56
    ...     77
    ...     ${EMPTY}
    Click               xpath=//button[text()="Salvar"]
    Span Campo Obrigatório          a Altura é obrigatória
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar novo aluno com email inválido

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho$gmail.com
    ...     56
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    [Teardown]      Clear Storage

Cenário: Tentar cadastrar com usuário já existente

    cad.Go To Page
    cad.Acceso          admin@bodytest.com          pwd123
    Click               xpath=//a[@href="/alunos"]
    Click               xpath=//a[@href="/alunos/new"]
    Fill Cadastro
    ...     Tony Stark
    ...     tonyzinho@gmail.com
    ...     56
    ...     77
    ...     1.73
    Click               xpath=//button[text()="Salvar"]
    cad.Wait For Toast          Email já existe no sistema.
    [Teardown]      Clear Storage