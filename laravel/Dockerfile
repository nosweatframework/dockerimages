FROM php:8.1-cli

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

COPY artisan.sh /app/artisan.sh

RUN chmod +x /usr/local/bin/install-php-extensions && \
    chmod +x /app/artisan.sh && \
    install-php-extensions @composer && \
    install-php-extensions apcu bcmath decimal gd imagick intl memcached opcache openswoole pcntl pdo_mysql pdo_pgsql redis zip

ENTRYPOINT ["/app/artisan.sh"]
CMD ["help"]
