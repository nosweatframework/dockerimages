## How to use

Create in your project a Dockerfile with something like this:

```
FROM 16nsk/laravel

COPY . /app
WORKDIR /app

RUN composer install --prefer-install=dist --no-dev --no-progress --optimize-autoloader --apcu-autoloader && \
    rm /usr/local/bin/install-php-extensions && \
    rm /usr/local/bin/composer && \
    chown -R www-data:www-data bootstrap/cache && \
    chown -R www-data:www-data storage

USER www-data

ENTRYPOINT ["/app/artisan.sh"]
CMD ["help"]
```
