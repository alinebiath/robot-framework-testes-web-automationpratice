*** Settings ***
# para testar um aplicação web é necessário utilizar a lib do Selenium
Library       SeleniumLibrary                            WITH NAME    selenium


*** Variables ***
${URL}        http://automationpractice.com/index.php
${BROWSER}    firefox


*** Keywords ***
#Setup and Teardown

Open navigator
    selenium.Open Browser       about:blank    ${BROWSER}
Close navigator
    selenium.Close Browser

#Scenario_01

Access the home page
    Go To              ${URL}
    Title Should Be    My Store

