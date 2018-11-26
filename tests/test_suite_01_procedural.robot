*** Settings ***
Test Setup       Open navigator
Test Teardown    Close navigator
Resource         ../resource/keywords_procedural.robot


*** Test Case ***
TestCase_01: Search for existing product
    Access the home page
    #Check if the home page was displayed
    #Enter the product name "Blouse" in the search field
    #Click the search button
    #Check if the product was displayed

#TestCase_02: Search for non existing product
    #Access the home page
    #Check if the home page was displayed
    #Enter the product name "non existing product" in the search field
    #Click the search button
    #Check the message "No results were found for your search "non existing product""



