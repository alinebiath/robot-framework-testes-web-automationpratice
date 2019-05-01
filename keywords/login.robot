*** Settings ***

Resource    libraries.robot
Resource    common.robot

*** Keywords ***

I login with valid credentials
    [Arguments]                                    ${username}
    ...                                            ${password}

    I am a non-registered user on the home page

    seleniumLib.Click Element                      link=Sign in

    seleniumLib.Wait Until Element Is Visible      css=div.row #center_column
    ...                                            timeout=20s

    seleniumLib.Input Text                         id=email
    ...                                            ${username}

    seleniumLib.Input Password                     id=passwd
    ...                                            ${password}

    seleniumLib.Capture Page Screenshot

    seleniumLib.Click Element                      id=SubmitLogin

I login with invalid credentials
    [Arguments]                                    ${username}
    ...                                            ${password}
    ...                                            ${error_msg}

    I am a non-registered user on the home page

    seleniumLib.Click Element                      link=Sign in

    seleniumLib.Input Text                         id=email
    ...                                            ${username}

    seleniumLib.Input Password                     id=passwd
    ...                                            ${password}

    seleniumLib.Click Element                      id=SubmitLogin

    seleniumLib.Wait Until Element Is Visible      xpath=//*[@id="center_column"]/div[1]
    ...                                            timeout=20s

    seleniumLib.Page Should Contain                ${error_msg}

    seleniumLib.Capture Page Screenshot