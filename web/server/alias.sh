#!/bin/bash

# Output colors shell
red=`tput setaf 1`
green=`tput setaf 2`

# Função para verificar se o PHPUnit está instalado
function phpunit(){
    if [ -f /usr/local/bin/phpunit ]; then
        echo = "${red}Alias do PHPUNIT já está criada. Execute em seu terminal: ${green}phpunit --version"
    else
        echo "${green}Alias do PHPUNIT criada com sucesso!"
        sudo sh -c "printf \"#!/bin/sh
        export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
        docker exec -t silex-app phpunit "$@" \\\$@
        \" > /usr/local/bin/phpunit"

        sudo chmod +x /usr/local/bin/phpunit
        echo = "${green}Execute em seu terminal o comando: phpunit ou phpunit --version!"
    fi

}

# Função para verificar se o Phing está instalado
function phing(){
    if [ -f /usr/local/bin/phing ]; then
        echo = "${red}Alias do PHING já está criada. Execute em seu terminal: ${green}phing"
    else
        echo "${green}Alias do PHING criada com sucesso!"
        sudo sh -c "printf \"#!/bin/sh
        export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
        docker exec -t silex-app phing "$@" \\\$@
        \" > /usr/local/bin/phing"

        sudo chmod +x /usr/local/bin/phing
        echo = "${green}Execute em seu terminal o comando: phing!"
    fi

}

# PHPUNIT
echo -n "Você deseja instalar o PHPUNIT (s/n)?"
read answer
if echo "$answer" | grep -iq "^s" ;then
    phpunit
else
    exit;
fi

# PHING
echo -n "Você deseja instalar o PHING (s/n)?"
read answer
if echo "$answer" | grep -iq "^s" ;then
    phing
else
    exit;
fi