*** Settings ***

Resource    common.robot
Resource    libraries.robot

*** Keywords ***

I want to register on the site
    seleniumLib.Click Element                       link=Sign in

    seleniumLib.Wait Until Page Contains Element    id=create-account_form
    ...                                             timeout=20s

    ${email}=                                       faker.Email
    seleniumLib.Input Text                          id=email_create
    ...                                             ${email}

    seleniumLib.Click Element                       id=SubmitCreate

    seleniumLib.Wait Until Page Contains Element    id=account-creation_form
    ...                                             timeout=20s

I fill the required fields
    seleniumLib.Click Element                       id=id_gender1

    ${first_name}=                                  faker.First Name
    seleniumLib.Input Text                          id=customer_firstname
    ...                                             ${first_name}

    ${last_name}=                                   faker.Last Name
    seleniumLib.Input Text                          id=customer_lastname
    ...                                             ${last_name}

    ${password}=                                    faker.Password
    seleniumLib.Input Password                      id=passwd
    ...                                             ${password}

    ${birth_day}=                                   faker.Day Of Month
    ${birth_day_nospace}=                           string.Strip String
    ...                                             ${birth_day}
    ...                                             mode=left
    ...                                             characters=0

    seleniumLib.Select From List By Value           id=days
    ...                                             ${birth_day_nospace}

    ${birth_month}=                                 faker.Month
    ${birth_month_nospace}=                         string.Strip String
    ...                                             ${birth_month}
    ...                                             mode=left
    ...                                             characters=0

    seleniumLib.Select From List By Value           id=months
    ...                                             ${birth_month_nospace}

    ${birth_year}=                                  faker.Year
    ${birth_year_nospace}=                          string.Strip String
    ...                                             ${birth_year}
    ...                                             mode=left

    seleniumLib.Select From List By Value           id=years
    ...                                             ${birth_year_nospace}

    ${address}=                                     faker.Street Address
    seleniumLib.Input Text                          id=address1
    ...                                             ${address}

    ${city}=                                        faker.City
    seleniumLib.Input Text                          id=city
    ...                                             ${city}

    ${state}=                                       faker.State
    seleniumLib.Select From List By Label           id=id_state
    ...                                             ${state}

    seleniumLib.Input Text                          id=postcode
    ...                                             00000

    ${phone}=                                       faker.Random Number
    ...                                             digits=8
    seleniumLib.Input Text                          id=phone
    ...                                             ${phone}

    ${phone_2}=                                     faker.Random Number
    ...                                             digits=8
    seleniumLib.Input Text                          id=phone_mobile
    ...                                             ${phone_2}

    ${address_2}=                                   faker.Street Address
    seleniumLib.Input Text                          id=alias
    ...                                             ${address_2}

    seleniumLib.Click Button                        id=submitAccount

    I should see the account management page