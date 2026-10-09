*** Settings ***
# Library
Library     FlaUILibrary
# Keywords
Resource    ../keywords/common.robot
Resource    ../keywords/assertions.robot
# Selectors
Resource    ../resources/selectors/toolbar.robot
Resource    ../resources/selectors/new_project_window.robot
Resource    ../resources/selectors/title_bar.robot
Resource    ../resources/selectors/project_explorer.robot


*** Variables ***
${TC_PROJECT}                           ${EMPTY}
${TC_SLM_KEY}                           ${EMPTY}
${JENKINS_WORKSPACE}                    ${EMPTY}
${FILE_NAME}                            ${EMPTY}
${SHORT_WAIT}                           5
${MEDIUM_WAIT}                          15
${LONG_WAIT}                            60
${PROJECT_LOCATION}                     C:\\tc-ui-automation-tests\\resources\\tc_projects
${SAMPLE_FILES_LOCATION}                C:\\tc-ui-automation-tests\\resources\\sample_files
${SAMPLE_APPS_LOCATION}                 C:\\tc-ui-automation-tests\\resources\\sample_app
${POSTFIX_PROJECT_LOCATION_JENKINS}     \\resources\\tc_projects
${PROJECT_PATH}                         ${PROJECT_LOCATION}\\${tc_project}\\${tc_project}.pjs
${POSTFIX_SAMPLE_APPS_JENKINS}          \\resources\\sample_app
${POSTFIX_SAMPLE_FILES_JENKINS}         \\resources\\sample_files
