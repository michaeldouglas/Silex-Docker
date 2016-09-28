FROM php:7.0-apache

MAINTAINER Michael Araujo <michaeldouglas010790@gmail.com>

# Instalação da máquina
RUN apt-get update \
&& useradd --user-group --create-home --shell /bin/false app \
&& apt-get install -y vim \
&& a2enmod rewrite \
&& a2enmod proxy \
&& a2enmod proxy_http \
&& apt-get install -y curl \
&& apt-get install -y net-tools \
&& curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install mysqli

# Instalação do Nodejs
RUN apt-get install -y nodejs \
&& apt-get install -y npm

# Variavel do caminho da aplicação
ENV HOME=/var/www/html

# Phing.
RUN pear channel-discover pear.phing.info
RUN pear install phing/phing-2.6.1

# PHP CodeSniffer
RUN curl -LsS https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar -o /usr/local/bin/phpcs \
    && chmod a+x /usr/local/bin/phpcs \
    && phpcs --version

# php-cs-fixer
RUN curl http://get.sensiolabs.org/php-cs-fixer.phar -o php-cs-fixer \
    && chmod a+x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

# phpunit
RUN curl -LsS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit \
    && chmod a+x /usr/local/bin/phpunit \
    && phpunit --version

#XDEBUG
RUN pecl install xdebug-2.4.0RC3
RUN echo "zend_extension=xdebug.so\nxdebug.cli_color=1\nxdebug.remote_autostart=1\nxdebug.remote_connect_back=1" > /usr/local/etc/php/conf.d/xdebug.ini


# Variaveis de ambiente do apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

# Utiliza o usuário app 
USER app

# Informa a pasta de trabalho da aplicação
WORKDIR $HOME/php/Silex/

# Retorna para o usuário root
USER root

# Copia a aplicação
COPY ./ $HOME/php/Silex/

# Realizar a permissão de pasta para o usuário da aplicação
RUN chown -R app $HOME/php/Silex

# Retorna para o usuário root
USER root

# Habilita a porta 80 do apache.
EXPOSE 22 80

# Atualiza as configurações default do Apache
ADD web/server/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Criar a pasta do composer
RUN mkdir $HOME/.composer && chown -R app $HOME/.composer

# Utiliza o usuário app 
USER root

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]