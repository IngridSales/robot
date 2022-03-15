*** Settings ***




*** Test Cases ***
# # #
# Cadastrar novo aluno

#     Acceso           admin@bodytest.com       pwd123
#     Get Text        css=div strong      contains        Administrador

#     Get Text        xpath=//a[text()="ALUNOS"]
#     Click           xpath=//a[text()="ALUNOS"]

#     Get Text        xpath=//h1[text()="Gestão de Alunos"]

#     Click           xpath=//a[@href="/alunos/new"]

#     Fill Text       css=#name       Tony Stark
#     Fill Text       css=#email      tonyzinho@gmail.com
#     Fill Text       css=#age        53
#     Fill Text       css=#weight       77
#     Fill Text       xpath=#feet_tall       1,70

#     Click           xpath=//input[type="number"]
#     Get Text        xpath=//div[text()="Aluno cadastrado com sucesso."]
# # #

Cadastrar novo plano

    Acceso           admin@bodytest.com       pwd123
    Get Text        css=div strong      contains        Administrador

    Get Text        xpath=//a[text()="PLANOS"]
    Click           xpath=//a[text()="PLANOS"]

    Get Text        xpath=//h1[text()="Gestão de Planos"]

    Click           xpath=//a[@href="/planos/new"]

    Fill Text       xpath=//input[@id="title"]       Plano teste
    Fill Text       xpath=//input[@id="duration"]      6
    Fill Text       xpath=//input[@name="price"]        50,00

    Click           xpath=//button[@form="formPlan"]

    Get Text        xpath=//div[text()="Plano cadastrado com sucesso"]
    
    Get Text        xpath=//td[text()="Plano teste"]

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


Excluir matricula

    Acceso           admin@bodytest.com       pwd123
    Get Text        css=div strong      contains        Administrador

    Click           xpath=//a[text()="MATRÍCULAS"]

    Get Text        xpath=//h1[text()="Gestão de Matrículas"]

    Fill Text       xpath=//input[text()="Buscar por aluno"]            David Backham

    Click           xpath=//button[@id="trash"]
    
    Get Text        css=h2 >> text=Você está certo disso?
    Click           xpath=//button[text()="SIM, pode apagar!"]

    Get Text        xpath=//div[text()="Matrícula removida com sucesso."]


