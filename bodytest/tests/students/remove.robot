*** Settings ***
Documentation           Remover alunos
Resource                ${EXECDIR}/resources/base.robot
Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


*** Test Case ***
Cenário: Remover aluno cadastrado

    &{student}          Create Dictionary       name=Lineu Silva       email=lineuzinho@gmail.com        age=56      weight=77       feet_tall=1.73

    Insert Student          ${student}
    Go To Students
    Fill Searchbox          Lineu
    Confirm Remove         
    [Teardown]              Clear Storage and Screenshot 
    
Cenário: Desistir da exclusão

    &{student}          Create Dictionary       name=Agostinho Carrara       email=carrarataxioutaxicarrara@gmail.com        age=56      weight=77       feet_tall=1.73

    Insert Student          ${student}
    Go To Students
    Fill Searchbox          Agostinho
    Cancel Remove        
    [Teardown]              Clear Storage and Screenshot 
