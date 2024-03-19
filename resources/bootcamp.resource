*** Settings ***

Library    AppiumLibrary

*** Variables ***


*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

Validate first view    #Valida a tela de login em termos de design
    [Arguments]    ${icon}    ${paragraph1}    ${paragraph2}    ${paragraph3}
    Wait Until Element Is Visible    ${icon}    10    #Checa se o icone em imagem aparece na tela
    Wait Until Page Contains    ${paragraph1}    10    #Checa se o texto Yodapp aparece na tela
    Wait Until Page Contains    ${paragraph2}     10    #Checa se o texto Mobile Training aparece na tela
    Wait Until Page Contains    ${paragraph3}    10    #Checa se o texto BY Papito! aparece na tela

Get started
    [Arguments]    ${text_button}    ${checkpoint_1}    ${checkpoint_2}    #Armazena argumentos
    Wait Until Page Contains    ${text_button}    10
    Click Text    ${text_button}
    Wait Until Page Contains    ${checkpoint_1}    10    #Marca o checkpoint em tela
    Wait Until Page Contains    ${checkpoint_2}    10    #Marca o checkpoint em tela
    
Click button
    [Arguments]    ${hub_option_text}    ${screen_option_text}    ${checkpoint_text}
    ${hamburger}    Set Variable    //android.widget.ImageButton[@content-desc="Open navigation drawer"]
    ${hub_options}    Set Variable    //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${hub_option_text}"]
    ${screen_options}    Set Variable    //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${screen_option_text}"]
    ${checkpoint}   Set Variable    //android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/toolbarTitle" and @text="${checkpoint_text}"] 
    
    Wait Until Element Is Visible    ${hamburger}    10
    Click Element    ${hamburger}
    Wait Until Element Is Visible    ${hub_options}    10
    Click Element    ${hub_options}
    Wait Until Element Is Visible    ${screen_options}    10
    Click Element    ${screen_options}
    Wait Until Element Is Visible   ${checkpoint}    10

    

Close session
    Sleep    5
    Close Application