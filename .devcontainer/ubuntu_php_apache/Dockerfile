FROM ubuntu:20.04
LABEL Author="Kai Schwarz"

ARG ADD_APT_PACKAGES=""
ARG PHP_VERSION=7.4

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# ---- APACHE 2 Installation ----
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update\
  && apt-get install -y software-properties-common\
  && add-apt-repository -y ppa:ondrej/php\
  && apt-get install -y \
  vim \
  curl \
  apache2 \
  libapache2-mod-php${PHP_VERSION} \
  php${PHP_VERSION}-cli \
  php${PHP_VERSION}-curl \
  php${PHP_VERSION}-gd \
  php${PHP_VERSION}-gmp \
  php${PHP_VERSION}-imap \
  php${PHP_VERSION}-mailparse \
  php${PHP_VERSION}-mbstring \
  php${PHP_VERSION}-mysql \
  php${PHP_VERSION}-soap \
  php${PHP_VERSION}-xml \
  php${PHP_VERSION}-xmlrpc \
  php${PHP_VERSION}-zip \
  php${PHP_VERSION}-xdebug \
  openssl \
  ca-certificates \
  unzip \
  ${ADD_APT_PACKAGES}

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername
RUN a2enmod rewrite
RUN service apache2 restart

# ---- Error Reporting / Debugging
COPY ./xdebug.ini /etc/php/${PHP_VERSION}/apache2/01-xdebug.ini
COPY ./xdebug.ini /etc/php/${PHP_VERSION}/cli/01-xdebug.ini
COPY ./error_reporting.ini /etc/php/${PHP_VERSION}/apache2/01-error_reporting.ini
COPY ./error_reporting.ini /etc/php/${PHP_VERSION}/cli/01-error_reporting.ini

# ---- Cleanup Apache Default Page
#RUN a2dissite 000-default && rm index.html

# ---- Composer Installation
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer &&\
  composer self-update --stable

# ---- Cleanup
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  rm /var/log/lastlog /var/log/faillog

# ---- Adding Health Check
HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

# ---- RUN Apache and Expose Ports
WORKDIR /var/www/html
EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
