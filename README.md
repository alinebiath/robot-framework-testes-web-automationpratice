# Testes automatizados para uma aplicação web com Robot Framework

- Testes aplicados em um exemplo de website de e-commerce: http://automationpractice.com/index.php
- Foram testados cenários básicos como: login, registro de nova conta, consulta de produtos e adição de produtos no carrinho.

## 1. Estrutura de arquivos e diretórios
Os testes estão estruturados nos seguintes diretórios:
- **requirements.txt**: arquivo que contém as chamadas para instalação das libraries do robot que são necessárias para executar os testes.
- **test-suites**: diretório que contém arquivos .robot com as suítes de testes (cenários ou casos de testes).
- **keywords**: diretório que contém arquivos <i>.robot</i> com a implementação das palavras-chaves (keywords).</br>

## 2.Pré condições para os testes
- Clonar esse projeto
- Python 2.7.x ou superior
- Baixar os webDrivers dos navegadores Firefox ou Chrome
- Usar um editor ASCII de sua preferência (VSCode, Atom, RIDE, etc)</br>

## 3. Preparando ambiente

### Instalando libraries Python necessárias

Instale todas a libraries Python necessárias, digitando no terminal o comando:

```sh
Linux / Mac
$ pip install -r requirements.txt --user
```

### Baixando webDrivers para os navegadores

> Baixe o driver do Firefox em: https://github.com/mozilla/geckodriver/releases 

> Baixe o driver do Chrome em: http://chromedriver.chromium.org/downloads 

Deve ser baixado o driver mais atualizado, de acordo com a versão do navegador. </br>
Após baixar os arquivos no diretório desejado, é preciso configurar o caminho deste diretório na variável $PATH do sistema. Essa configuração varia de acordo com o sistema operacional.

## 4. Executando os testes
> Os comandos abaixo devem ser executados no terminal, no diretório raiz do projeto.

Executando todos os testes:

```sh
$ python -m robot -d output/all test-suites/
```

Executando somente os cenários básicos:
```sh
$ python -m robot -d output/basic-scenarios -i basic test-suites/
```

## 5. Gerando documentação adicional

Gerando documentação para os casos de testes existentes:

```sh
$ python -m robot.testdoc test-suites/ doc/test-suites.html
```
Gerando docuentação para as palavras-chaves do usuário (common.robot):

```sh
$ python -m robot.libdoc keywords/common.robot doc/common.html
```
