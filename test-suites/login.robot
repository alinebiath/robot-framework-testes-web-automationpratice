*** Settings ***

Documentation    Test suite to validate the login action.

Resource         ../keywords/login.robot

Test Setup       Open navigator
Test Teardown    Close navigator

***Variables***

${USERNAME}      testemng@teste.com.br
${PASSWORD}      SuperSecretPassword!


*** Test Cases ***

Scenario 01: Successful Login
    [Tags]                                      basic
    When I login with valid credentials                ${USERNAME}
    ...                                         ${PASSWORD}

    Then I should see the account management page

Scenario 02: Unsuccessful Login
    [Tags]                                      alternative
    [Template]                                  I login with invalid credentials

    invalid                                     ${PASSWORD}                       Invalid email address.
    ${USERNAME}                                 invalid                           Authentication failed.
    ${EMPTY}                                    ${EMPTY}                          An email address required.
    ${USERNAME}                                 ${EMPTY}                          Password is required.
    ${EMPTY}                                    ${PASSWORD}                       An email address required.