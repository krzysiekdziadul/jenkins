*** Settings ***
Library             FlaUILibrary
Resource            ../../configs/config.robot

Test Teardown       Run Keywords    Close TestComplete    AND
...                     Remove Project Directory    ${TC_PROJECT}


*** Variables ***
${TC_PROJECT}       TC-T1022
${UIA}              UIA2
@{ELEMENTS}
...                 ${run_project_icon_explorer}
...                 ${organize_tests_icon_explorer}
...                 ${close_icon}
...                 ${add_object_icon}
...                 ${save_all_icon}


*** Test Cases ***
Create New Project from "New" button on Toolbar
    [Documentation]
    ...    This test case simulates the process of creating a new project using the "New" button on the toolbar.
    ...    More information can be found [https://smartbear.atlassian.net/projects/TC?selectedItem=com.atlassian.\
    ...    plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/TC-T1022?projectId=10900]
    [Tags]    new_project
    Launch TestComplete    ${UIA}
    Create New Project from    Toolbar "New Project" Button    ${TC_PROJECT}
    # INTENTIONAL FAILURE (demo): click on a non-existing element to check that Robot takes a screenshot
    Click    identifier=//Button[@Name='FAKE_BUTTON_DOES_NOT_EXIST']
    Verify Project is created    ${TC_PROJECT}
    Verify Elements Are Enabled    @{ELEMENTS}
