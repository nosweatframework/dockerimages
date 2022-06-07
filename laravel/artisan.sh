#!/usr/bin/env sh
php artisan config:cache
php artisan route:cache
php artisan event:cache
php artisan view:cache
php artisan $*
