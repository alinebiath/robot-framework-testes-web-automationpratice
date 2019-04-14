*** Settings ***
Documentation    Test suite to validate behaviour of the consults and
...              interactions with shopping cart in website:
...              http://automationpractice.com/index.php

Resource         ../keywords/consults.robot

Test Setup       Open navigator
Test Teardown    Close navigator


*** Test Cases ***
Scenario 01: Search for existing products
    [Tags]                                                                                          existproduct
    Given I am a non-registered user on the home page
    When I search for the product "Blouse"
    I should see the searched product "Blouse"

Scenario 02: Search for non existing products
    [Tags]                                                                                          noproduct
    Given I am a non-registered user on the home page
    When I search for the product "non existing product"
    Then I should see the message "No results were found for your search "non existing product""

Scenario 03: List products
    [Tags]                                                                                          listproduct
    Given I am a non-registered user on the home page
    When I select the "WOMEN" category in the main menu categories
    And I select the sub-category "Summer Dresses"
    Then I should see the page with the selected product "Summer Dresses"

Scenario 04: Add products to shopping cart
    [Tags]                                                                                          addproduct
    Given I am a non-registered user on the home page
    And I search for the product "t-shirt"
    When I should see the searched product "t-shirt"
    And I add to shopping cart the listed product
    And I proceed to checkout
    Then I should see the products in shopping cart page

Scenario 05: Remove products
    [Tags]                                                                                          removeproduct
    [Setup]                                                                                         I have at least one product in my cart
    Given I am a non-registered user on the home page
    When I access the shopping cart
    And I remove the product
    Then I should confirm the exclusion

