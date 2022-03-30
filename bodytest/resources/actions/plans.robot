*** Settings ***
Documentation           Ações do projeto - Planos

*** Keywords ***
Go To Form Plans
    Click                           xpath=//a[@href="/planos/new"]
    Wait For Elements State         h1 >> text=Novo plano           visible         5

New Plan
    [Arguments]         ${plan}        
    Fill Text           css=input[name="title"]            ${plan.title}
    Fill Text           css=input[name="duration"]         ${plan.duration}
    Fill Text           css=input[name="price"]            ${plan.price}
    Submit Form