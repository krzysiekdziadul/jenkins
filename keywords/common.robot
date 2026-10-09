*** Settings ***
Library     FlaUILibrary
Library     OperatingSystem
Resource    ../configs/config.robot


*** Keywords ***
Set TestComplete Project Path
    [Documentation]    Set TestComplete project path based on the project location
    ${IS_TC_KEY}=    Get length    ${TC_SLM_KEY}
    Set Global Variable
    ...    ${SAMPLE_FILES_LOCATION}
    ...    \"${SAMPLE_FILES_LOCATION}\\${file_name}\"
    IF    ${IS_TC_KEY} != 0
        Set Global variable    ${PROJECT_LOCATION}    ${JENKINS_WORKSPACE}${POSTFIX_PROJECT_LOCATION_JENKINS}
        Set Global Variable
        ...    ${PROJECT_PATH}
        ...    \"${PROJECT_LOCATION}\\${tc_project}\\${tc_project}.pjs\"
        Set Global Variable
        ...    ${SAMPLE_FILES_LOCATION}    ${JENKINS_WORKSPACE}${POSTFIX_SAMPLE_FILES_JENKINS}
        Set Global Variable
        ...    ${SAMPLE_APPS_LOCATION}    ${JENKINS_WORKSPACE}${POSTFIX_SAMPLE_APPS_JENKINS}
    END

Launch TestComplete
    [Documentation]    Launch TestComplete application and switch UIA to UIA2 or UIA3 by setup UIA Variables in test.
    [Arguments]    ${UIA}
    Launch TestComplete with args    ${UIA}    ${EMPTY}

Launch TestComplete with args
    [Documentation]    Launch TestComplete application and switch UIA to UIA2 or UIA3 by setup UIA Variables in test.
    ...    Verify if SLM key was passed as argument. If yes, set it as access key.
    ...    If additional command args are passed, add them to the command.
    [Arguments]    ${UIA}    ${ADDITIONAL_COMMAND_ARGS}

    ${IS_TC_KEY}=    Get length    ${TC_SLM_KEY}
    IF    ${IS_TC_KEY} != 0
        Set TestComplete Project Path
        ${RUN_COMMAND}=    Set Variable    /AccessKey:${TC_SLM_KEY} ${ADDITIONAL_COMMAND_ARGS}
        Launch application with args    TestComplete    ${RUN_COMMAND}
        Sleep    ${LONG_WAIT}
    ELSE
        Launch Application with args    TestComplete    ${ADDITIONAL_COMMAND_ARGS}
    END
    Switch uia to    ${UIA}
    Sleep    ${MEDIUM_WAIT}

Close TestComplete
    [Documentation]    Close TestComplete application and desktop applications
    Close Application By Name    name=TestComplete

    ${processes}=    Catenate    SEPARATOR=,
    ...    "BCB_OpenApp*"    "C#_OpenApp*"    "Delphi_OpenApp*"    "DelphiNet_OpenApp*"
    ...    "VB_OpenApp*"    "VB_WindowsFormApp*"    "VBNet_OpenApp*"    "VCNet_OpenApp*"
    ...    "WPF_OpenApp*"    "WPF3D_OpenApp*"    "simpleJavaApp*"    "MSVC_OpenApp*"
    ...    "Qt_OpenApp*"    "WebView2WindowsFormsBrowser*"    "chrome*"

    Run    powershell.exe Stop-Process -Name ${processes} -Force -ErrorAction SilentlyContinue

Enter projects attributes on New Project Window
    [Documentation]    Project Window opened after click on "New" button on Toolbar
    [Arguments]    ${tc_project}    @{options}
    ${project_path}=    Set Variable
    ...    ${PROJECT_LOCATION}\\${tc_project}\\
    Set Text To Textbox    identifier=${project_location_field}    value=${project_path}
    Focus    identifier=${project_name_input_field}
    Double Click    identifier=${project_name_input_field}
    Press Key    t'${tc_project}'
    Sleep    ${MEDIUM_WAIT}
    Click    identifier=${finish_button}

Create New Project from
    [Documentation]    Create new project from "New" button on Start Page
    [Arguments]    ${action}    ${tc_project}    @{options}
    Conditional Action Based on Keyword Existence    ${action}
    Wait until element exist    identifier=${new_project_window}
    Enter projects attributes on New Project Window    ${tc_project}    @{options}

Conditional Action Based on Keyword Existence
    [Documentation]    Check if keyword exists in robot framework
    [Arguments]    ${action}
    ${is_keyword}=    Run Keyword And Return Status    Keyword Should Exist    ${action}
    IF    ${is_keyword}
        Run Keyword    ${action}
    ELSE
        Wait Until Element Exist    identifier=${action}
        Click    identifier=${action}
    END

Remove Project Directory
    [Documentation]    Cleanup actions after test.
    [Arguments]    ${TC_PROJECT}
    Remove Directory    resources/tc_projects/${TC_PROJECT}/    recursive=True
