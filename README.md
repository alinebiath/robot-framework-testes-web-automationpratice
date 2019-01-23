# Automated tests for website with Robot Framework

- Tests applied to sample ecommerce website: http://automationpractice.com/index.php
- Were tested basic flows such as registering new customer, consulting products and adding products to the cart

### 1. Pre-conditions for the tests
- Clone the project
- Python 2.7.15 installed
- Gheckodriver to Firefox browser installed.See how: https://take.net/blog/take-test/instalacao-geckodriver-driver-para-abrir-o-firefox-no-selenium/
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>https://take.net/blog/take-test/instalacao-geckodriver-driver-para-abrir-o-firefox-no-selenium/

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
