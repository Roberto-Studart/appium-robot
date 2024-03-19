*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Must log in successfully

    [Tags]    sucess-login

    Start session

    Get started
    Navigate to    Formulários
    Go to item    Login    Olá Padawan, vamos testar o login?

    Input Text       id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
    Input Text       id=com.qaxperience.yodapp:id/etPassword     jedi
    Click Element    id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    Boas vindas, logado você está.

    Close session

should not log in with an incorrect password

    [Tags]    wrong-password
    Start session

    Get started
    Navigate to    Formulários
    Go to item    Login    Olá Padawan, vamos testar o login?

    Input Text       id=com.qaxperience.yodapp:id/etEmail        yoda@qax.com
    Input Text       id=com.qaxperience.yodapp:id/etPassword     jedi222
    Click Element    id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    Oops! Credenciais incorretas.

    Close session