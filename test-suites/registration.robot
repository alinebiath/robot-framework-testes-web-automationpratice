*** Settings ***
Documentation    Test suite to validate behaviour of the customer
...              registration in website.

Resource         ../keywords/registration.robot

Test Setup       Open navigator
Test Teardown    Close navigator


*** Test Cases ***
Scenario 01: Add client
    [Tags]                                               addclient
    Given I am a non-registered user on the home page
    And I want to register on the site
    When I fill the required fields
    Then I should see the account management page
