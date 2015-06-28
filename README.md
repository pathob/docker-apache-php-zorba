# docker-apache-php-zorba

This docker container automatically provides an apache web server with php and zorba.

## Docker compose example

`docker-compose.yml`

```
apache:
    build: docker-apache-php-zorba
    ports:
        - "13370:80"
    volumes:
        - ../sources:/var/www
    stdin_open: true
    tty: true
```

## Zorba documentation

The zorba documentation is extremely outdated, but there is not mutch more information in the web.

[Building and Installing Zorba](http://www.zorba.io/documentation/3.0/zorba/build/build_and_install)

[Zorba with PHP 5 - Ubuntu Installation](http://www.zorba.io/documentation/latest/zorba/install/php_ubuntu_tutorial/)


