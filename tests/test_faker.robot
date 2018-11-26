*** Settings ***
Library    FakerLibrary

*** Test Case ***
FakerLibrary Words Generation
    ${day}=      FakerLibrary.Month
    Log          Day: ${day}
    ${email}=    FakerLibrary.Email
    Log          E-mail: ${email}
