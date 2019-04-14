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
    Login with valid credentials                ${USERNAME}
    ...                                         ${PASSWORD}

    I should see the account management page

Scenario 02: Unsuccessful Login
    [Template]                                  Login with invalid credentials

    invalid                                     ${PASSWORD}    Invalid email address.
    ${USERNAME}                                 invalid        Authentication failed.
    ${EMPTY}                                    ${EMPTY}       An email address required.
    ${USERNAME}                                 ${EMPTY}       Password is required.
    ${EMPTY}                                    ${PASSWORD}    An email address required.