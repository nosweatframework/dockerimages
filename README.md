# Docker images

This images are intended to be used as a base for php applications.

Check our [JetsDev](https://youtube.com/@jetsdev) youtube channel also, as we're adding videos that involve using this images.

## What is different from the base PHP images?

1. Allows to tweak by environment variables many of PHP configurations.
  Say that you decided to tweak the memory limits or the amount of php-fpm workers in the pool.
  The problem is that you'd need to inject an alternative configuration file.
  What this extending base image offers, using the environment variables capability of php, to change them on deployment.
2. They add some of the all the time used extensions in production, and in development.
  The base php images are extremly light, and that is for a good reason I do love this.
  PHP with extra extensions you don't need, will make the running process eat some additional ram.
  Well, ram is important in the Cloud environments and I prefer to give it to Opcache and Apcu better.
  Still, in all projects using Symfony, Laravel, Magento, WordPress or Drupal, I noticed in time that some extensions are used all the time. Example is APCu, which today can be used to accelerate class mapping from composer's autoloader, opcache which makes the difference from 500ms to 50ms in many cases, redis (probably some would prefer memcached) that it's mandatory in horizontal scalled containers to share sessions and critical cache, and so on.
3. For most cases, speed your application container build.
  Extending the parent php image and adding same common extensions adds a lot of time. Getting this time to almost a few seconds helps, especially when the build is done on platforms like GitHub Action or Gitlab's CI/CD, where every minute is paid with money.

## How to use them:

_To be written_

## NOTE:

The images extend the fpm version of php. They can be used for running tasks, as php cli is included in it, being a dependency for a build with either fpm or mod_php. We don't support and we strongly recommend to stop using the Apache with prefork, mod_php based version of php, as that requires more complicated calculations to tweak the workers balance in Apache and it is using a lot of ram more, while being slower same time. PHP-FPM management of workers in a pool is much supperior to mod_php, and this way, using either Apache or Nginx, or any lighter web server with FCGI support (including Nginx Ingress Controller!) you can maximize your production at a higher level.
