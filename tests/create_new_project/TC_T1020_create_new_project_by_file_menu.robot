*** Settings ***
Library             FlaUILibrary
Resource            ../../configs/config.robot

Test Teardown       Run Keywords    Close TestComplete    AND
...                     Remove Project Directory    ${TC_PROJECT}


*** Variables ***
${TC_PROJECT}       TC-T1020
${UIA}              UIA2
@{ELEMENTS}
...                 ${run_project_icon_explorer}
...                 ${organize_tests_icon_explorer}
...                 ${close_icon}
...                 ${add_object_icon}
...                 ${save_all_icon}


*** Test Cases ***
Create New Project from "File" button on menu entry point
    [Documentation]
    ...    This test case simulates the process of creating a new project using the "File" button on the menu entry point.
    ...    More information can be found [https://smartbear.atlassian.net/projects/TC?selectedItem=com.atlassian.\
    ...    plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/TC-T1020?projectId=10900]
    [Tags]    new_project
    Launch TestComplete    ${UIA}
    Create New Project from    MenuBar "File->New->New Project" Button    ${TC_PROJECT}
    Verify Project is created    ${TC_PROJECT}
    Verify Elements Are Enabled    @{ELEMENTS}
