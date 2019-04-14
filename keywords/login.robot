*** Settings ***

Resource    libraries.robot
Resource    common.robot

*** Keywords ***

Login with valid credentials
    [Arguments]                                    ${username}
    ...                                            ${password}

    I am a non-registered user on the home page

    selenium.Click Element                         link=Sign in

    selenium.Wait Until Element Is Visible         css=div.row #center_column

    selenium.Input Text                            id=email
    ...                                            ${username}

    selenium.Input Password                        id=passwd
    ...                                            ${password}

    selenium.Click Element                         id=SubmitLogin

    selenium.Capture Page Screenshot               filename=login_succesful.png

    #removing existing screenshot files from output directory
    system.Remove Files                            ${CURDIR}/../output/login/login_unsuccesful-1.png
    ...                                            ${CURDIR}/../output/login/login_unsuccesful-2.png
    ...                                            ${CURDIR}/../output/login/login_unsuccesful-3.png
    ...                                            ${CURDIR}/../output/login/login_unsuccesful-4.png
    ...                                            ${CURDIR}/../output/login/login_unsuccesful-5.png


Login with invalid credentials
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
    ...                                            timeout=15s

    selenium.Page Should Contain                   ${error_msg}

    selenium.Capture Page Screenshot               filename=login_unsuccesful-{index}.png
