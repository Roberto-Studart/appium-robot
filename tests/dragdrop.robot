*** Settings ***

Resource    ../resources/base.resource
Library     ../resources/libs/extend.py

*** Test Cases ***
Deve arrastar o skywalker e soltar no topo da lista

    Start session
    Get started

    Navigate to    Star Wars
    Go to item    Lista    Skywalker

    ${origin}    Set Variable    //android.widget.TextView[@text="@skywalker"]/../../..//*[contains(@resource-id, "drag_handle")]
    ${target}    Set Variable    //android.widget.TextView[@text="@mando"]/../../..//*[contains(@resource-id, "drag_handle")]

    My Drag and Drop    ${origin}    ${target}

    Sleep    3
    Close session