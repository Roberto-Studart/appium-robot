*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Choose the Padwan level

    Start session
    Get started

    Navigate to                      Formulários
    Go to item                       Cadastro    Crie sua conta.
    Select level                     Padawan

    Close session

Choose the Jedi level

    Start session
    Get started

    Navigate to                      Formulários
    Go to item                       Cadastro    Crie sua conta.
    Select level                     Jedi
    
    Close session

Choose the Sith level

    Start session
    Get started

    Navigate to                      Formulários
    Go to item                       Cadastro    Crie sua conta.

    Select level                     Sith
    Close session


Choose the others level

    Start session
    Get started

    Navigate to                      Formulários
    Go to item                       Cadastro    Crie sua conta.


    Select level                     Outros
    Close session

*** Keywords ***
Select level
    [Arguments]    ${level}

    Click Element                    id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text     ${level}