*** Settings ***
Documentation    Test suite to validate behaviour of the customer 
...              registration in website: http://automationpractice.com/index.php

Resource         ../keywords/keywords_02_customer_registration.robot

Test Setup       Open navigator
Test Teardown    Close navigator


*** Test Cases ***
Scenario 01: Add client
    [Tags]                                                                                          addclient
    Given I am on the home page
    And I want to register on the site
    When I fill the required fields
    Then I should see the account management page
