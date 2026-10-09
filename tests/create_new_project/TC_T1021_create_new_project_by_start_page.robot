*** Settings ***
Library             FlaUILibrary
Resource            ../../configs/config.robot

Test Teardown       Run Keywords    Close TestComplete    AND
...                     Remove Project Directory    ${TC_PROJECT}


*** Variables ***
${TC_PROJECT}       TC-T1021
${UIA}              UIA2
@{ELEMENTS}
...                 ${run_project_icon_explorer}
...                 ${organize_tests_icon_explorer}
...                 ${close_icon}
...                 ${add_object_icon}
...                 ${save_all_icon}


*** Test Cases ***
Create New Project from "New" button on Start Page
    [Documentation]
    ...    This test case simulates the process of creating a new project using the "New Project" button located on Start Page.
    ...    More information can be found [https://smartbear.atlassian.net/projects/TC?selectedItem=com.atlassian.\
    ...    plugins.atlassian-connect-plugin:com.kanoah.test-manager__main-project-page#!/testCase/TC-T1021?projectId=10900]
    [Tags]    new_project
    Launch TestComplete    ${UIA}
    Create New Project from    ${start_page_new_project}    ${TC_PROJECT}
    Sleep    ${SHORT_WAIT}
    Verify Elements Are Enabled    @{ELEMENTS}
