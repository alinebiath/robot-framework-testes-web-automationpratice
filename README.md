# Automated tests for website with Robot Framework

- Tests applied to sample ecommerce website: http://automationpractice.com/index.php
- Were tested basic flows such as registering new customer, consult of products and adding products to the cart

### 1. Pre-conditions for the tests
- Clone the project
- Python 2.7.15 installed
- Gheckodriver to Firefox browser tests.See how: https://take.net/blog/take-test/instalacao-geckodriver-driver-para-abrir-o-firefox-no-selenium/
- Chromedriver to Chrome browser tests. See how: http://chromedriver.chromium.org/getting-started
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### 2. Installing required Python libraries
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the <i>requirements.txt file</i>.</br>

### 3. Running Robot Framework tests
To run all tests from all suites:
```sh
$ robot -d output/ test-suites/
```
To run only the test with the <i>addclient</i> tag of the test suites:
```sh
$ robot -d output/ -i addclient test-suites/
```
### 4. The robotframework-faker library for random test data generation
 - An interesting library for generating random data when you do not have large test mass volumes
 - Just install and instantiate the library and apply its easy keywords:
 ```sh
 *** Settings ***
 Library       FakerLibrary   WITH NAME    faker
 
 *** Keywords ***
 I fill the required fields
  [Documentantion]            Filling in the user registration
    ${first_name}=            faker.First Name
    selenium.Input Text       id=customer_firstname     ${first_name}
    ${last_name}=             faker.Last Name
    selenium.Input Text       id=customer_lastname      ${last_name}
    ${password}=              faker.Password            length=6
    selenium.Input Password   id=passwd                 ${password}
 ```
- See that just applying the FakerLibrary keyword "First Name", will be stored in the variable any name.
- The same is done to last name and password. For the password an additional option were passed, where the number of characters of the password is 6.
- See more in https://guykisel.github.io/robotframework-faker
 
 
