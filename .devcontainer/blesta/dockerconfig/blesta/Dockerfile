FROM papakai/ubuntu_php_apache:latest
LABEL Author="Kai Schwarz"

ARG PHP_VERSION=7.4
ENV DEBIAN_FRONTEND=noninteractive
ENV MYSQL_ROOT_PASSWORD=roottutgut
ENV MYSQL_DATABASE=blestadb
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=middleware

COPY ./ioncube_loaders_lin_x86-64.tar.gz /tmp
COPY ./blesta.zip /tmp
COPY ./001-blesta.conf /etc/apache2/sites-enabled/
COPY ./entrypoint.sh /
COPY ./php.ini /etc/php/${PHP_VERSION}/cli/php.ini
COPY ./php.ini /etc/php/${PHP_VERSION}/apache2/php.ini

RUN apt-get -y install git

RUN chmod 0777 /*.sh

RUN tar -xzf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /usr/local\
    && rm -f /tmp/ioncube_loaders_lin_x86-64.tar.gz \
    && echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_${PHP_VERSION}.so\n" >> /etc/php/${PHP_VERSION}/apache2/php.ini \
    && echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_${PHP_VERSION}.so\n" >> /etc/php/${PHP_VERSION}/cli/php.ini

RUN mkdir -p /var/www/html\
    && unzip -q /tmp/blesta.zip -d /usr/share\
    && chown -R www-data.www-data /usr/share/blesta /usr/share/uploads

EXPOSE 80 443
VOLUME ["/var/www", "/var/log/apache2"]
ENTRYPOINT ["/entrypoint.sh"]
