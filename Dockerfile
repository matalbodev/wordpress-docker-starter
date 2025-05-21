FROM wordpress:latest

# Installer WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x wp-cli.phar \
 && mv wp-cli.phar /usr/local/bin/wp

# Installer quelques outils utiles
RUN apt-get update && apt-get install -y \
    less \
    mariadb-client \
    iputils-ping \
 && apt-get clean

# Activer SSL
RUN a2enmod ssl
RUN a2enmod rewrite

# Copier la configuration SSL
COPY apache-conf/ssl.conf /etc/apache2/sites-available/ssl.conf
RUN a2ensite ssl

# Copier et activer la configuration ServerName
COPY apache-conf/servername.conf /etc/apache2/conf-available/servername.conf
RUN a2enconf servername