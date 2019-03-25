*** Settings ***

Resource    keywords_common.robot
Resource    libraries.robot

*** Keywords ***

####Actions
I want to register on the site
    selenium.Click Element                                                           link=Sign in
    
    selenium.Wait Until Page Contains Element                                        id=create-account_form
    ...                                                                              timeout=8s

    ${email}=                                                                        faker.Email
    selenium.Input Text                                                              id=email_create
    ...                                                                              ${email}

    selenium.Click Element                                                           id=SubmitCreate

    selenium.Wait Until Page Contains Element                                        id=account-creation_form
    ...                                                                              timeout=8s

I fill the required fields
    selenium.Click Element                                                           id=id_gender1

    ${first_name}=                                                                   faker.First Name
    selenium.Input Text                                                              id=customer_firstname
    ...                                                                              ${first_name}

    ${last_name}=                                                                    faker.Last Name
    selenium.Input Text                                                              id=customer_lastname
    ...                                                                              ${last_name}

    ${password}=                                                                     faker.Password
    selenium.Input Password                                                          id=passwd
    ...                                                                              ${password}

    ${birth_day}=                                                                    faker.Day Of Month
    ${birth_day_nospace}=                                                            string.Strip String
    ...                                                                              ${birth_day}
    ...                                                                              mode=left
    ...                                                                              characters=0
    selenium.Select From List By Value                                               id=days
    ...                                                                              ${birth_day_nospace}

    ${birth_month}=                                                                  faker.Month
    ${birth_month_nospace}=                                                          string.Strip String
    ...                                                                              ${birth_month}
    ...                                                                              mode=left
    ...                                                                              characters=0
    selenium.Select From List By Value                                               id=months
    ...                                                                              ${birth_month_nospace}

    ${birth_year}=                                                                   faker.Year
    ${birth_year_nospace}=                                                           string.Strip String
    ...                                                                              ${birth_year}
    ...                                                                              mode=left
    selenium.Select From List By Value                                               id=years
    ...                                                                              ${birth_year_nospace}

    ${address}=                                                                      faker.Street Address
    selenium.Input Text                                                              id=address1
    ...                                                                              ${address}

    ${city}=                                                                         faker.City
    selenium.Input Text                                                              id=city
    ...                                                                              ${city}

    ${state}=                                                                        faker.State
    selenium.Select From List By Label                                               id=id_state
    ...                                                                              ${state}

    selenium.Input Text                                                              id=postcode
    ...                                                                              00000

    ${phone}=                                                                        faker.Random Number
    ...                                                                              digits=8
    selenium.Input Text                                                              id=phone
    ...                                                                              ${phone}

    ${phone_2}=                                                                      faker.Random Number
    ...                                                                              digits=8
    selenium.Input Text                                                              id=phone_mobile
    ...                                                                              ${phone_2}

    ${address_2}=                                                                    faker.Street Address
    selenium.Input Text                                                              id=alias
    ...                                                                              ${address_2}

    selenium.Click Button                                                            id=submitAccount

###Validations
I should see the account management page
# validação da criação do cadastro
    selenium.Wait Until Page Contains Element                                        id=center_column
    ...                                                                              timeout=8s

    selenium.Element Text Should Be                                                  xpath=/html/body/div/div[2]/div/div[3]/div/h1
    ...                                                                              MY ACCOUNT
    
    selenium.Capture Page Screenshot                                                 created_account01.png
