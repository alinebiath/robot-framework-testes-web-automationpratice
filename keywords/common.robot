*** Settings ***

Documentation    Common keywords from the test.

Resource         libraries.robot

*** Variables ***

${URL}           http://automationpractice.com/index.php
${BROWSER}       firefox

*** Keywords ***

Open navigator
    seleniumLib.Open Browser                              about:blank
    ...                                                   ${BROWSER}

    seleniumLib.Maximize Browser Window

Close navigator
    seleniumLib.Close Browser

I am a non-registered user on the home page
    seleniumLib.Go To                                     ${URL}

    seleniumLib.Title Should Be                           My Store

I have at least one product in my cart
    [Documentation]                                    Calls the steps for ensure
    ...                                                that at least one product is in the cart.

    Open navigator
    I am a non-registered user on the home page
    I search for the product "t-shirt"
    I should see the searched product "t-shirt"
    I add to shopping cart the listed product
    I proceed to checkout
    I should see the products in shopping cart page

Scroll to element
    [Documentation]                                    Perform the scroll action in the page.
    [Arguments]                                        ${locator}
    ${element_position_y}                              seleniumLib.Get Horizontal Position
    ...                                                ${locator}

    seleniumLib.Execute Javascript                        window.scrollTo(0,${element_position_y})


I should see the account management page
    [Documentation]                                    Validate the inital account management page.
    seleniumLib.Wait Until Page Contains Element          id=center_column
    ...                                                timeout=20s

    seleniumLib.Element Text Should Be                    css=h1[class='page-heading']
    ...                                                MY ACCOUNT

    seleniumLib.Element Should Be Visible                 css=ul[class='myaccount-link-list']

    seleniumLib.Capture Page Screenshot

