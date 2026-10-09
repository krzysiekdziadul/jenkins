*** Settings ***
Library     FlaUILibrary
Resource    ../configs/config.robot


*** Keywords ***
Verify Project is created
    [Documentation]    Check if the Project is created by asserting the project name from title bar.
    [Arguments]    ${project_name}
    Sleep    ${SHORT_WAIT}
    Wait Until Element Exist    identifier=${title_bar}
    ${RESULT}    Get Name From Element    identifier=${title_bar}
    ${EXPECTED}    Set Variable    ${project_name}.pjs
    Should Contain    ${RESULT}    ${EXPECTED}

Verify Elements Are Enabled
    [Documentation]    Verify if elements passed on list are enabled.
    [Arguments]    @{elements}
    FOR    ${element}    IN    @{elements}
        Element Should Be Enabled    identifier=${element}
    END
