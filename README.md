# Automated tests for website with Robot Framework

- Tests applied for sample ecommerce website: http://automationpractice.com/index.php.
- Were tested basic flows such as: login, registering new account, consult of products and adding products to the cart.

## 1. Files and directories structure
The tests are structured in files and directories as follows:
- **requirements.txt**: contains all python required libraries.
- **test-suites**: contains the <i>.robot</i> files with test suites (scenarios or test cases).
- **keywords**: contains <i>.robot</i> files with user keywords implementation.
- **doc**: contains additional documentation about relevant user keywords.</br>

## 2. Pre-conditions
- This project cloned
- Python 2.7.x
- Gheckodriver for Firefox browse (see install instructions section)
- (Optional) Chromedriver for Chrome browse (see install instructions section)
- An ASCII editor of your preference to edit the files (i.e. VSCode, Atom, RIDE, etc)</br>
- Operating system based on UNIX

## 3. Environment setup

### Installing Python required libraries

Install all required Python libraries typing on terminal command:

```sh
Linux / Mac
$ pip install -r requirements.txt --user
```

### Installing browser drivers

> Download Firefox driver at https://github.com/mozilla/geckodriver/releases to run test against Firefox

> Download Chrome driver at http://chromedriver.chromium.org/downloads to run test against Chrome

After download the driver(s) to desired directory, i.e.: $HOME/browse-drivers/<drive-browse-dir>/, setup your $PATH variable to recognize the drivers location by editing the properly file that the used terminal command will reads and executes commands from. Or, type the following command on terminal:

```sh
$ export GECKODRIVER_HOME=$HOME/browse-drivers/geckodriver
$ export $PATH=$PATH:$GECKODRIVER_HOME

$ export CHROMEDRIVER_HOME=$HOME/browse-drivers/chromedriver
$ export $PATH=$PATH:$CHROMEDRIVER_HOME
```

## 4. Running acceptance tests
> The above commands should be execute on terminal command at the root project directory.

Runnig all tests:

```sh
$ robot -d output/all test-suites/
```

Running only basic scenarios:
```sh
$ robot -d output/basic-scenarios -i basic test-suites/
```

Running tests on Chrome browser:

```sh
$ robot -d output/all -v BROWSER:chrome test-suites/
```

## 5. Generating additional documentation

Generating documentation for existing test cases:

```sh
$ python -m robot.testdoc test-suites/ doc/test-suites.html
```
Generating documentation for user keywords (i.e.: common.robot):

```sh
$ python -m robot.libdoc keywords/common.robot doc/common.html
```