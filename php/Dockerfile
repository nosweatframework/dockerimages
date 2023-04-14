ARG PHP_VERSION=8.1
ARG ALPINE=

FROM php:${PHP_VERSION}-fpm${ALPINE}

ARG COMPOSER_VERSION=2

ARG USERNAME=php
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Madalin Ignisca <git@madalin.me>"
LABEL description="PHP image to run PHPFPM or PHP Workers"
LABEL repo="https://github.com/nosweatframework/dockerimages"

ENV PRECISION=14
ENV OUTPUT_BUFFERING=4096
ENV MAX_EXECUTION_TIME=30
ENV MAX_INPUT_TIME=60
ENV MAX_INPUT_NESTING_LEVEL=64
ENV MAX_INPUT_VARS=1000
ENV MEMORY_LIMIT=128M
ENV ERROR_REPORTING="E_ALL & ~E_DEPRECATED & ~E_STRICT"
ENV DISPLAY_ERRORS=Off
ENV LOG_ERROR_MAX_LEN=1024
ENV POST_MAX_SIZE=8M
ENV UPLOAD_MAX_FILESIZE=2M
ENV MAX_FILE_UPLOADS=20
ENV ALLOW_URL_FOPEN=On
ENV DEFAULT_SOCKET_TIMEOUT=60
ENV DATE_TIMEZONE=UTC
ENV MYSQLI_MAX_PERSISTENT=-1
ENV MYSQLI_MAX_LINKS=-1
ENV MYSQLND_COLLECT_STATISTICS=On
ENV MYSQLND_COLLECT_MEMORY_STATISTICS=Off
ENV PGSQL_MAX_PERSISTENT=-1
ENV PGSQL_MAX_LINKS=-1
ENV SESSION_SAVE_HANDLER=files
ENV SESSION_NAME="PHPSESSID"
ENV LDAP_MAX_LINKS=-1
ENV OPCACHE_ENABLE=1
ENV OPCACHE_ENABLE_CLI=0
ENV OPCACHE_MEMORY_CONSUMPTION=128
ENV OPCACHE_INTERNED_STRINGS_BUFFER=8
ENV OPCACHE_MAX_ACCELERATED_FILES=10000
ENV OPCACHE_USE_CWD=1
ENV OPCACHE_VALIDATE_TIMESTAMPS=1
ENV OPCACHE_REVALIDATE_FREQ=2
ENV OPCACHE_REVALIDATE_PATH=0
ENV OPCACHE_SAVE_COMMENTS=1
ENV OPCACHE_ENABLE_FILE_OVERRIDE=0
ENV OPCACHE_PRELOAD=
ENV OPCACHE_PRELOAD_USER=

ENV PM=dynamic
ENV PM_START_SERVERS=2
ENV PM_MIN_SPARE_SERVERS=1
ENV PM_MAX_SPARE_SERVERS=3
ENV PM_MAX_CHILDREN=4
ENV PM_PROCESS_IDLE_TIMEOUT=10s
ENV ACCESS_FORMAT="%R - %u %t \"%m %r%Q%q\" %s %f %{mili}d %{kilo}M %C%%"
ENV REQUEST_SLOWLOG_TIMEOUT=0
ENV REQUEST_SLOWLOG_TRACE_DEPTH=20
ENV REQUEST_TERMINATE_TIMEOUT=0

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions

RUN install-php-extensions \
    amqp \
    apcu \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    gmp \
    igbinary \
    imagick \
    intl \
    mailparse \
    memcached \
    msgpack \
    mysqli \
    oauth \
    opcache \
    openswoole \
    pcntl \
    pcov \
    pdo_mysql \
#    propro \
    pspell \
    raphf \
    redis \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    xmlrpc \
    xsl \
    yaml \
    zip

RUN if [ "$PHP_VERSION" = "7.4" ] ; \
    then \
        install-php-extensions propro ; \
    fi

RUN install-php-extensions @composer-$COMPOSER_VERSION

COPY php.ini /usr/local/etc/php/php.ini
COPY php-fpm.conf /usr/local/etc/php-fpm.conf

STOPSIGNAL SIGQUIT

EXPOSE 9000
EXPOSE 9001
CMD ["php"]
