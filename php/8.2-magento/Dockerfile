FROM php:8.2.13-fpm-bookworm

COPY --from=mlocati/php-extension-installer:2.1.69 /usr/bin/install-php-extensions /usr/local/bin/

RUN /usr/local/bin/install-php-extensions \
    apcu \
    amqp \
    bcmath \
    event \
    gd \
    gmp \
    intl \
    mcrypt \
    mongodb \
    opcache \
    pcntl \
    pcov \
    pdo_mysql \
    redis \
    soap \
    sockets \
    tidy \
    uopz \
    uuid \
    uv \
    xsl \
    yaml \
    zip
