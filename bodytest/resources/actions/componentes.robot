*** Settings ***
Documentation           Ações de componentes genericos


*** Keywords ***

Wait For Toast
    [Arguments]                     ${txt_esperado}
    Wait For Elements State         css=.Toastify__toast-body >> text=${txt_esperado}       visible         3

Total Items Should Be
    [Arguments]                     ${number}
    ${element}                      Set Variable                css=#pagination .total
    Wait For Elements State         ${element}                  visible                             5
    Get Text                        ${element}                  ==                      Total: ${number}