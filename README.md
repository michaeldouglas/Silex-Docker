## Silex Skeleton Application Docker - 0.1

Essa aplicação foi criada para ser utilizada no curso de Silex do PHP Conference Brasil.

## Compatibilidade

* PHP >= 7.0
* Sistemas UNIX

## Dependências Docker

`Não` se preocupe ao executar a máquina será instalada as dependências e irá gerar o link com a máquina do Silex

* Redis
* Mariadb
 
## Dependências PHP

`Não` se preocupe ao executar a máquina será instalada as dependências do PHP

* PHP CodeSniffer
* Phing
* PHP CodeSniffer
* php-cs-fixer
* phpunit
 
## Environment MariaDB

* **Banco de dados:** silexphp
* **Usuário:** root
* **Senha:** 123456

## Instalação

Na estrutura da aplicação `Silex` execute o build do Docker para começar a utilizar:


    docker-compose up --build

Depois que realizar o build da aplicação você não precisa mais executar o comando com a flag `--build` nas próxima execução
basta utilizar o comando sem a flag:


    docker-compose up

## Testando seu Silex App

Abra uma nova aba no seu terminal e então execute o comando:

```
curl localhost:8000
```

Para utilizar o phpunit execute o comando:

```
phpunit
```

![](http://gifsec.com/wp-content/uploads/GIF/2015/06/Dance-With-Me-Cat.gif?gs=a)