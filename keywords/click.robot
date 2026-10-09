*** Settings ***
Library     FlaUILibrary
Resource    ../configs/config.robot


*** Keywords ***
Toolbar "New Project" Button
    [Documentation]    Clicks on the "New Project" button in the toolbar
    Wait until element exist    identifier=${new_menu_item}
    Click    identifier=${new_menu_item}
    Click    identifier=${new_project_toolbar}

MenuBar "File->New->New Project" Button
    [Documentation]    Clicks on the "New Project" button located in File->New
    Wait until element exist    identifier=${file}
    Click    identifier=${file}
    Click    identifier=${new}
    Click    identifier=${new_project}
