*** Settings ***

Library    AppiumLibrary

Resource    ../../resources/bootcamp.resource

*** Test Cases ***
Must check the first view
    [Tags]    first-view-check
    Start session
    Validate first view    xpath=//android.widget.ImageView[@content-desc="Icon"]    Yodapp    Mobile Training    by Papito!
    Close session


Must check the home page
    [Tags]    home-check    
    Start session
    Get started    QAX    Clique em Botões    QAX
    Close session


Must click on simple buttons
    [Tags]    simple-click
    Start session
    Get started    QAX    Clique em Botões    QAX
    Click button    Clique em Botões    Clique simples    Botão clique simples
    Close session


Must click on long press button
    [Tags]    long-click
    Start session
    Get started    QAX    Clique em Botões    QAX
    Click button    Clique em Botões    Clique longo    Botão clique longo
    
    ${locator}    Set Variable    id=com.qaxperience.yodapp:id/long_click
    ${positions}    Get Element Location    ${locator}
    Tap With Positions    1000    ${${positions}[x], ${positions}[y]}
    Close session

Must mark the correct checkbox
    [Tags]    checkbox
    Start session
    Get started    QAX    Clique em Botões    QAX
    Click button    Check e Radio    Checkbox    Checkbox  

    @{techs}    Create List    Ruby     Python    Java    Javascript    C#    Robot Framework

    FOR    ${tech}    IN    @{techs}
        Click Element    //android.widget.CheckBox[@resource-id="com.qaxperience.yodapp:id/checkboxButton" and @text="${tech} "]
        Sleep    1
    END
    Close session

Must mark the correct radio button
    [Tags]    radio
    
    Start session
    Click Element    //android.widget.RadioButton[contains(@text,"Javascript")]
    Sleep    3