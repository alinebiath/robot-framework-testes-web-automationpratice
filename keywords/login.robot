*** Settings ***

Resource    libraries.robot
Resource    common.robot

*** Keywords ***

I login with valid credentials
    [Arguments]                                    ${username}
    ...                                            ${password}

    I am a non-registered user on the home page

    selenium.Click Element                         link=Sign in

    selenium.Wait Until Element Is Visible         css=div.row #center_column
    ...                                            timeout=20s

    selenium.Input Text                            id=email
    ...                                            ${username}

    selenium.Input Password                        id=passwd
    ...                                            ${password}

    selenium.Capture Page Screenshot

    selenium.Click Element                         id=SubmitLogin

I login with invalid credentials
    [Arguments]                                    ${username}
    ...                                            ${password}
    ...                                            ${error_msg}

    I am a non-registered user on the home page

    selenium.Click Element                         link=Sign in

    selenium.Input Text                            id=email
    ...                                            ${username}

    selenium.Input Password                        id=passwd
    ...                                            ${password}

    selenium.Click Element                         id=SubmitLogin

    selenium.Wait Until Element Is Visible         xpath=//*[@id="center_column"]/div[1]
    ...                                            timeout=20s

    selenium.Page Should Contain                   ${error_msg}

    selenium.Capture Page Screenshot