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

# Variavel do caminho da aplicação
ENV HOME=/var/www/html

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

# Habilita a porta 8080 do apache.
EXPOSE 80

# Atualiza as configurações default do Apache
ADD web/server/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# Criar a pasta do composer
RUN mkdir $HOME/.composer && chown -R app $HOME/.composer

# Utiliza o usuário app 
USER app
 
RUN cd $HOME/php/Silex && composer update

# Utiliza o usuário app 
USER root

CMD ["web/server/run.sh"]