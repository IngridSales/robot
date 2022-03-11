*** Settings ***

Resource            ${EXECDIR}/resources/base.robot

Test Setup          Inicio de Sesion
*** Test Cases ***
Login com campo de email vazio

    Fill Text       css=#password       pwd123
    Click           css=button >> text=Entrar
    Buscar Span Email Inválido         O e-mail é obrigatório

Login com campo de senha vazio

    Fill Text       css=#email          admin@bodytest.com
    Click           css=button >> text=Entrar
    Buscar Span Senha Inválida          A senha é obrigatória

Login com email inválido

    Acceso          admin%bodytest.com          123123
    Buscar Span Email Inválido         Informe um e-mail válido
    

Login com senha inválida

    Acceso           admin@bodytest.com       pwd
    Buscar e Fechar Toast

Login do admin

    Acceso           admin@bodytest.com       pwd123
    Get Text        css=div strong      contains        Administrador






# # #
# # Cadastrar novo aluno

# #     Acceso           admin@bodytest.com       pwd123
# #     Get Text        css=div strong      contains        Administrador

# #     Get Text        xpath=//a[text()="ALUNOS"]
# #     Click           xpath=//a[text()="ALUNOS"]

# #     Get Text        xpath=//h1[text()="Gestão de Alunos"]

# #     Click           xpath=//a[@href="/alunos/new"]

# #     Fill Text       css=#name       Tony Stark
# #     Fill Text       css=#email      tonyzinho@gmail.com
# #     Fill Text       css=#age        53
# #     Fill Text       css=#weight       77
# #     Fill Text       css=#feet_tall   1,73

# #     Click           xpath=//input[type="number"]
# #     Get Text        xpath=//div[text()="Aluno cadastrado com sucesso."]
# # #

# Cadastrar novo plano

#     Acceso           admin@bodytest.com       pwd123
#     Get Text        css=div strong      contains        Administrador

#     Get Text        xpath=//a[text()="PLANOS"]
#     Click           xpath=//a[text()="PLANOS"]

#     Get Text        xpath=//h1[text()="Gestão de Planos"]

#     Click           xpath=//a[@href="/planos/new"]

#     Fill Text       xpath=//input[@id="title"]       Plano teste
#     Fill Text       xpath=//input[@id="duration"]      6
#     Fill Text       xpath=//input[@name="price"]        50,00

#     Click           xpath=//button[@form="formPlan"]

#     Get Text        xpath=//div[text()="Plano cadastrado com sucesso"]

# ##
# # Cadastrar nova matricula

# #     Acceso           admin@bodytest.com       pwd123
# #     Get Text        css=div strong      contains        Administrador

# #     Get Text        xpath=//a[text()="MATRÍCULAS"]
# #     Click           xpath=//a[text()="MATRÍCULAS"]

# #     Get Text        xpath=//h1[text()="Gestão de Matrículas"]

# #     Click           xpath=//a[@href="/matriculas/new"]

# #     Fill Text       xpath=//div[text()="Digite o nome do aluno..."]       Teste

# #     Fill Text       xpath=//div[text()="Selecione..."]       Plano Test
# ##

# Excluir cadastro

#     Acceso           admin@bodytest.com       pwd123
#     Get Text        css=div strong      contains        Administrador

#     Click           xpath=//a[text()="ALUNOS"]

#     Get Text        xpath=//h1[text()="Gestão de Alunos"]

#     Fill Text       xpath=//input[text()="Buscar aluno"]            Teste
#     Click           xpath=//button[@id="trash"]

#     Get Text        css=h2 >> text=Você está certo disso?
#     Click           xpath=//button[text()="SIM, pode apagar!"]

#     Get Text        xpath=//div[text()="Aluno removido com sucesso."]

# Excluir plano

#     Acceso           admin@bodytest.com       pwd123
#     Get Text        css=div strong      contains        Administrador

#     Click           xpath=//a[text()="PLANOS"]

#     Get Text        xpath=//h1[text()="Gestão de Planos"]

#     Fill Text       xpath=//input[text()="Buscar plano"]            Plano teste
#     Click           xpath=//button[@id="trash"]
    
#     Get Text        css=h2 >> text=Você está certo disso?
#     Click           xpath=//button[text()="SIM, pode apagar!"]

#     Get Text        xpath=//div[text()="Plano removido com sucesso."]


# Excluir matricula

#     Acceso           admin@bodytest.com       pwd123
#     Get Text        css=div strong      contains        Administrador

#     Click           xpath=//a[text()="MATRÍCULAS"]

#     Get Text        xpath=//h1[text()="Gestão de Matrículas"]

#     Fill Text       xpath=//input[text()="Buscar por aluno"]            David Guetta

#     Click           xpath=//button[@id="trash"]
    
#     Get Text        css=h2 >> text=Você está certo disso?
#     Click           xpath=//button[text()="SIM, pode apagar!"]

#     Get Text        xpath=//div[text()="Matrícula removida com sucesso."]








*** Keywords ***
Acceso

    [Arguments]         ${email}        ${pass}

    Fill Text       css=#email          ${email}
    Fill Text       css=#password       ${pass}

    Click           css=button >> text=Entrar

Buscar e Fechar Toast

    Wait For Elements State         xpath=//div[@class="Toastify"]/..//
    Get Text        css=.Toastify >> text=Usuário e/ou senha inválidos.
    Click           css=button >> text=✖︎
    
Buscar Span Email Inválido

    [Arguments]         ${span_email_inv}           

    Get Text        css=span        contains        ${span_email_inv}

Buscar Span Senha Inválida

    [Arguments]         ${span_senha_inv}           

    Get Text        css=span        contains        ${span_senha_inv}