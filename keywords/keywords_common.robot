*** Settings ***

Resource      libraries.robot

*** Variables ***

${URL}        http://automationpractice.com/index.php
${BROWSER}    firefox


*** Keywords ***

###Setup and Teardown Begin
Open navigator
    selenium.Open Browser              about:blank
    ...                                ${BROWSER}

    selenium.Maximize Browser Window

Close navigator
    selenium.Close Browser
###Setup and Teardown End


I am on the home page
    selenium.Go To                      ${URL}

    selenium.Title Should Be            My Store

I have at least one product in my cart
# keyword que chama outras keywords para garantir que ao menos 1 produto estará adicionado ao cart
    Open navigator
    I am on the home page
    I search for the product "t-shirt"
    I should see the searched product "t-shirt"
    I add to shopping cart the listed product
    I proceed to checkout
    I should see the shopping cart page with the products and its data and values

Scroll to element
    [Arguments]                         ${locator}
    #obter a posição horizontal do elemento
    ${element_position_y}               selenium.Get Horizontal Position
    ...                                 ${locator}
    #executar comando de scroll de 0 até a posíção do elemento
    selenium.Execute Javascript         window.scrollTo(0,${element_position_y})



