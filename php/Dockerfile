FROM ubuntu:20.04

ARG PHP_VERSION=7.4
ARG USERNAME=app
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

LABEL maintainer="Madalin Ignisca <hi@madalin.me>"
LABEL description="PHP image to run PHPFPM or PHP Workers, suitable for Laravel, but not only"
LABEL repo="https://github.com/madalinignisca/dockerimages"
LABEL tag="16nsk/php"

RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --create-home --shell /bin/bash --uid ${USER_UID} --gid ${USER_GID} ${USERNAME}

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
      gnupg \
      software-properties-common \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get install --no-install-recommends -y \
    php${PHP_VERSION}-apcu \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-pgsql \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-xml
