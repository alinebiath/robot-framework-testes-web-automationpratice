*** Settings ***

Resource    common.robot
Resource    libraries.robot


*** Keywords ***

I search for the product "${product}"
    selenium.Input Text                          id=search_query_top
    ...                                          ${product}

    selenium.Click Button                        name=submit_search

I select the "WOMEN" category in the main menu categories
    selenium.Mouse Over                          css=a[title='Women']

I select the sub-category "${product}"
    selenium.Wait Until Element is Visible       css=#block_top_menu> ul > li:nth-child(1) > ul
    ...                                          timeout=20s

    selenium.Click Element                       link=${product}

I add to shopping cart the listed product
    selenium.Mouse Over                          css=#center_column > ul > li

    selenium.Wait Until Element is Visible       css=a[title*='Add to cart']
    ...                                          timeout=20s

    std.Set Test Variable                        ${locator}
    ...                                          css=a[title*='Add to cart']

    Scroll to element                            ${locator}

    selenium.Click Element                       css=a[title*='Add to cart']

I proceed to checkout
    selenium.Wait Until Page Contains Element    css=#layer_cart .clearfix
    ...                                          timeout=20s

    selenium.Wait Until Element is Visible       css=a[title*='Proceed to checkout']
    ...                                          timeout=20s

    selenium.Click Element                       css=a[title*='Proceed to checkout']

I access the shopping cart
    selenium.Click Element                       css=.shopping_cart a[title*='cart']

    selenium.Wait Until Page Contains Element    xpath=//*[@id="center_column"]
    ...                                          timeout=20s

I remove the product
    selenium.Click Element                       id=1_1_0_0

    selenium.Wait Until Element Is Visible       css=p[class='alert alert-warning']
    ...                                          timeout=20s

I should see the searched product "${product}"
    selenium.Wait Until Page Contains Element    css=#center_column > h1
    ...                                          timeout=20s

    selenium.Title Should Be                     Search - My Store

    ${texto}                                     selenium.Get Text
    ...                                          css=span[class='lighter']

    ${textoSemEspaco}                            string.Strip String
    ...                                          ${texto}
    ...                                          mode=both
    ...                                          characters="

    std.Should Be Equal                          ${textoSemEspaco}
    ...                                          ${product}
    ...                                          ignore_case=True

    selenium.Element Should Be Visible           css=#center_column .product-container

    selenium.Element Should Be Visible           xpath=//*[@id="center_column"]//a[contains(@title,${product})]

    selenium.Capture Page Screenshot

I should see the message "No results were found for your search "${no_product}""
    selenium.Wait Until Page Contains Element    css=#center_column > h1
    ...                                          timeout=20s

    selenium.Element Should Contain              css=p[class="alert alert-warning"]
    ...                                          ${no_product}

    selenium.Capture Page Screenshot

I should see the page with the selected product "${product}"
    selenium.Wait Until Page Contains Element    id=selectProductSort
    ...                                          timeout=20s

    selenium.Title Should Be                     ${product} - My Store

    ${texto}                                     selenium.Get Text
    ...                                          css=span[class='cat-name']

    ${textoSemEspaco}                            string.Strip String
    ...                                          ${texto}
    ...                                          mode=both

    std.Should Be Equal                          ${textoSemEspaco}
    ...                                          ${product}
    ...                                          ignore_case=true

    selenium.Element Should Be Visible           css=ul[class="product_list grid row"]

    selenium.Capture Page Screenshot

I should see the products in shopping cart page
    selenium.Wait Until Page Contains Element    xpath=//*[@id="center_column"]
    ...                                          timeout=20s

    selenium.Page Should Contain Element         id=order-detail-content

    ${element_position_y}                        selenium.Get Horizontal Position
    ...                                          xpath=//*[@id="center_column"]/p[2]/a[1]

    ${off_set}                                   std.Evaluate
    ...                                          550

    ${total_position_y}                          std.Evaluate
    ...                                          ${element_position_y} - ${off_set}

    selenium.Execute Javascript                  window.scrollTo(0,${total_position_y})

    selenium.Capture Page Screenshot

I should confirm the exclusion
    selenium.Element Should Contain              css=p[class='alert alert-warning']
    ...                                          Your shopping cart is empty.

    selenium.Capture Page Screenshot