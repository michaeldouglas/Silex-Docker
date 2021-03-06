## Silex Skeleton Application Docker - 0.1

Essa aplicação foi criada para ser utilizada no curso de Silex do PHP Conference Brasil.

Os arquivos estáticos de: Javascript, css e Imagens encontram-se no repositório: [https://github.com/michaeldouglas/silex-static](https://github.com/michaeldouglas/silex-static)

[![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg?maxAge=2592000)](https://github.com/michaeldouglas/Silex-Docker)

## Compatibilidade

* PHP >= 7.0
* Sistemas UNIX

## Dependências Docker

`Não` se preocupe ao executar a máquina será instalada as dependências e irá gerar o link com a máquina do Silex

* Redis
* Mysql
 
## Dependências PHP

`Não` se preocupe ao executar a máquina será instalada as dependências do PHP

* PHP CodeSniffer
* Phing
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

## Executar em segundo plano


    docker-compose up -d

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

## Utilização do VueJs

Como nossa Template Engine é o Twig e os delimitadores do VueJS são iguais ao do Twig.

Foi necessário alterar os demilitadores do VueJs para outro padrão sendo assim para utilizar os dados vindos do VueJs em seu tamplete você deve utilizar os Delimitadores da seguinte maneira:

```
${SUAVARIAVEL}
```

## Remover Containers

Para remover todos os containers você pode executar em seu terminal o comando:

```
docker rm $(docker ps -a -q)
```

## Remover Imagens

Para remover todos as imagens você pode executar em seu terminal o comando:

```
docker rmi $(docker images -q)
```

## Remover Imagens

Para realizar a parada do ambiente, você deve executar em seu terminal o comando:

```
docker stop silexdocker_web_1 silexdocker_redis_1
```

## Para criar uma Machine Docker
Para realizar criar uma Machine Docker, você deve executar em seu terminal o comando:

```
docker-machine create --driver virtualbox default
docker-machine env default
eval "$(docker-machine env default)"
```

## SSH Machine 
Para entrar em SSH em sua Machine Docker, você deve executar em seu terminal o comando:

```
docker-machine ssh default
```