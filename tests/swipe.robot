*** Settings ***

Resource    ../resources/base.resource

***Test Cases***

Should allow removing Darth Vader
    [Tags]    Darth

    Start session
    Get started

    Navigate to    Star Wars
    Go to item    Lista    Darth Vader

    ${positions}    Get Element Location    xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]

    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Evaluate        ${positions}[x] - 600
    ${offset_y}    Set Variable    ${positions}[y]
    
    Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1000

    Click Element    com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Does Not Contain    Darth Vader

    Close session


Should allow removing Mandaloriano

    [Tags]    Manda

    Start session
    Get started
    Navigate to    Star Wars
    Go to item    Lista    Mandaloriano

    ${positions}    Get Element Location    //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "indicator")]

    ${start_x}     Set Variable    ${positions}[x]
    ${start_y}     Set Variable    ${positions}[y]
    ${offset_x}    Set Variable    ${positions}[x] - 580
    ${offset_y}    Set Variable    ${positions}[y]

    Click Element    com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Does Not Contain    Mandaloriano