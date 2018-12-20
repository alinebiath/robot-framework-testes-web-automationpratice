*** Settings ***
# para testar um aplicação web.
Library       SeleniumLibrary                            WITH NAME    selenium
# para manipular strings.
Library       String                                     WITH NAME    string
# para geração de dados de teste aleartórios.
Library       FakerLibrary                               WITH NAME    faker
Library       BuiltIn                                    WITH NAME    std

*** Variables ***
${URL}        http://automationpractice.com/index.php
${BROWSER}    firefox


*** Keywords ***
###Setup and Teardown
Open navigator
    selenium.Open Browser                                                            about:blank                                                             ${BROWSER}
    selenium.Maximize Browser Window
Close navigator
    selenium.Close Browser

####Actions
I search for the product "${product}"
    selenium.Input Text                                                              id=search_query_top                                                     ${product}
    selenium.Click Button                                                            name=submit_search

I select the "WOMEN" category in the main menu categories
    selenium.Mouse Over                                                              css=#block_top_menu > ul > li:nth-child(1) > a

I select the sub-category "${product}"
    selenium.Wait Until Element is Visible                                           xpath=//*[@id="block_top_menu"]/ul/li[1]/ul                             timeout=12s
    selenium.Click Element                                                           link=${product}

I add to shopping cart the listed product
    selenium.Mouse Over                                                              xpath=//*[@id="center_column"]/ul/li/div
    selenium.Wait Until Element is Visible                                           xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]             timeout=8s
    std.Set Test Variable                                                            ${locator}                                                              xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
    Scroll to element                                                                ${locator}
    selenium.Click Element                                                           xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]

I proceed to checkout
    selenium.Wait Until Page Contains Element                                        css=#layer_cart > div.clearfix                                          timeout=8s
    selenium.Wait Until Element is Visible                                           xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    selenium.Click Element                                                           xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a

I access the shopping cart
    selenium.Click Element                                                           xpath=/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a
    selenium.Wait Until Page Contains Element                                        xpath=//*[@id="center_column"]                                          timeout=8s

I remove the product
    selenium.Click Element                                                           id=1_1_0_0
    selenium.Wait Until Element Is Visible                                           xpath=//*[@id="center_column"]/p                                        timeout=8s

I want to register on the site
    selenium.Click Element                                                           link=Sign in
    selenium.Wait Until Page Contains Element                                        id=create-account_form                                                  timeout=8s
    ${email}=                                                                        faker.Email
    selenium.Input Text                                                              id=email_create                                                         ${email}
    selenium.Click Element                                                           id=SubmitCreate
    selenium.Wait Until Page Contains Element                                        id=account-creation_form                                                timeout=8s

I fill the required fields
    selenium.Click Element                                                           id=id_gender1
    ${first_name}=                                                                   faker.First Name
    selenium.Input Text                                                              id=customer_firstname                                                   ${first_name}
    ${last_name}=                                                                    faker.Last Name
    selenium.Input Text                                                              id=customer_lastname                                                    ${last_name}
    ${passwd}=                                                                       faker.Password
    selenium.Input Password                                                          id=passwd                                                               ${passwd}
    ${birth_day}=                                                                    faker.Day Of Month
    ${birth_day_ns}=                                                                 string.Strip String                                                     ${birth_day}                                                   mode=left           characters=0
    selenium.Select From List By Value                                               id=days                                                                 ${birth_day_ns}
    ${birth_month}=                                                                  faker.Month
    ${birth_month_ns}=                                                               string.Strip String                                                     ${birth_month}                                                 mode=left           characters=0
    selenium.Select From List By Value                                               id=months                                                               ${birth_month_ns}
    ${birth_year}=                                                                   faker.Year
    ${birth_year_ns}=                                                                string.Strip String                                                     ${birth_year}                                                  mode=left
    selenium.Select From List By Value                                               id=years                                                                ${birth_year_ns}
    ${address}=                                                                      faker.Street Address
    selenium.Input Text                                                              id=address1                                                             ${address}
    ${city}=                                                                         faker.City
    selenium.Input Text                                                              id=city                                                                 ${city}
    ${state}=                                                                        faker.State
    selenium.Select From List By Label                                               id=id_state                                                             ${state}
    selenium.Input Text                                                              id=postcode                                                             00000
    ${phone}=                                                                        faker.Random Number                                                     digits=8
    selenium.Input Text                                                              id=phone                                                                ${phone}
    ${phone_2}=                                                                      faker.Random Number                                                     digits=8
    selenium.Input Text                                                              id=phone_mobile                                                         ${phone_2}
    ${address_2}=                                                                    faker.Street Address
    selenium.Input Text                                                              id=alias                                                                ${address_2}
    selenium.Click Button                                                            id=submitAccount

###Validations
I should see the searched product "${product}"
# validação de resultado para produtos pesquisados
    selenium.Wait Until Page Contains Element                                        css=#center_column > h1                                                 timeout=8s
    selenium.Title Should Be                                                         Search - My Store
    #checar se o texto "SEARCH - produto" da página de resultado confere com o produto pesquisado.
    ${texto}                                                                         selenium.Get Text                                                       xpath=//*[@id="center_column"]/h1/span[1]
    ${textoSemEspaco}                                                                string.Strip String                                                     ${texto}                                                       mode=both           characters="
    std.Should Be Equal                                                              ${textoSemEspaco}                                                       ${product}                                                     ignore_case=True
    #checar se o produto é exibido no body.
    selenium.Element Should Be Visible                                               xpath=//*[@id="center_column"]/ul/li/div[@class="product-container"]
    #checar se o texto do produto exibido contém a palavra pesquisada.
    selenium.Element Should Be Visible                                               xpath=//*[@id="center_column"]//a[contains(@title,${product})]
    selenium.Capture Page Screenshot                                                 outuput_existproduct01.png

I should see the message "No results were found for your search "${no_product}""
# validação de resultado para produtos pesquisados e não existentes
    selenium.Wait Until Page Contains Element                                        css=#center_column > h1
    #verifica se a mensagem de "no results were found" é exibido na página.
    selenium.Element Should Contain                                                  xpath=//*[@id="center_column"]/p[@class="alert alert-warning"]          ${no_product}
    selenium.Capture Page Screenshot                                                 outuput_noexistproduct01.png

I should see the page with the selected product "${product}"
# validação de resultado para produtos selecionados no menu principal
    selenium.Wait Until Page Contains Element                                        id=selectProductSort                                                    timeout=8s
    selenium.Title Should Be                                                         ${product} - My Store
    #checar se o texto do cabeçalho do resultado da busca confere com o produto pesquisado.
    ${texto}                                                                         selenium.Get Text                                                       xpath=//*[@id="center_column"]/h1/span[1]
    ${textoSemEspaco}                                                                string.Strip String                                                     ${texto}                                                       mode=both
    std.Should Be Equal                                                              ${textoSemEspaco}                                                       ${product}                                                     ignore_case=true
    #checar se algum produto é exibido no body.
    selenium.Element Should Be Visible                                               xpath=//*[@id="center_column"]/ul[@class="product_list grid row"]
    selenium.Capture Page Screenshot                                                 outuput_existproduct02.png

I should see the shopping cart page with the products and its data and values
# validação dos dados do produto no carrinho
    selenium.Wait Until Page Contains Element                                        xpath=//*[@id="center_column"]                                          timeout=8s
    selenium.Element Should Contain                                                  css=td.cart_description > p:nth-child(1) > a:nth-child(1)               Faded Short Sleeve T-shirts
    #solução alternativa para fazer scroll até um ponto da página e fazer screenshot
    ${element_position_y}                                                            selenium.Get Horizontal Position                                        xpath=//*[@id="center_column"]/p[2]/a[1]
    ${total_position_y}                                                              std.Evaluate                                                            ${element_position_y} - 550
    #executa o scroll de 0 até a posição - 550
    selenium.Execute Javascript                                                      window.scrollTo(0,${total_position_y})
    selenium.Capture Page Screenshot                                                 cart_product01.png

I should confirm the exclusion
# validação do carrinho vazio
    selenium.Element Should Contain                                                  xpath=//*[@id="center_column"]/p                                        Your shopping cart is empty.
    selenium.Capture Page Screenshot                                                 empty_cart01.png

I should see the account management page
# validação da criação do cadastro
    selenium.Wait Until Page Contains Element                                        id=center_column                                                        timeout=8s
    selenium.Element Text Should Be                                                  xpath=/html/body/div/div[2]/div/div[3]/div/h1                           MY ACCOUNT
    selenium.Capture Page Screenshot                                                 created_account01.png


###common
I am on the home page
    selenium.Go To                                                                   ${URL}
    selenium.Title Should Be                                                         My Store

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
    [Arguments]                                                                      ${locator}
    #obter a posição horizontal do elemento
    ${element_position_y}                                                            selenium.Get Horizontal Position                                        ${locator}
    #executar comando de scroll de 0 até a posíção do elemento
    selenium.Execute Javascript                                                      window.scrollTo(0,${element_position_y})



