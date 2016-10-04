FROM mdbaaraujo/silex

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

RUN composer update

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]