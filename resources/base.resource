*** Settings ***

Library    AppiumLibrary

*** Variables ***
${START}        QAX    #Variável para o botão com texto QAX no hub inicial do APP


*** Keywords ***

Start session
    Open Application    http://localhost:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/app/yodapp-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

Get started
    Wait Until Page Contains         ${START}    5    
    Click Text                       ${START}

Navigate to
    [Arguments]    ${item_text}
    ${HAMBURGER}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"] 
    Wait Until Element Is Visible    ${HAMBURGER}    5
    Click Element                    ${HAMBURGER}      

    
    ${menu_item}    Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]
    Wait Until Element Is Visible    ${menu_item}    5    #Espera até que o item de menu "Clique em Botões" esteja visível
    Click Element                    ${menu_item}         #Clica no item de menu "Clique em Botões"

Go to item
    [Arguments]    ${item}    ${item_checkpoint}
    Wait Until Page Contains         ${item}    5
    Click Text                       ${item}  
    Wait Until Page Contains         ${item_checkpoint}            

Close session
    Sleep    4
    Close Application

