FROM php:7.1-fpm-alpine


RUN apk add --no-cache --virtual .persistent-deps \
        $PHPIZE_DEPS \
        freetype-dev \
        libjpeg-turbo-dev \
        libxpm-dev \
        libpng-dev \
        icu-dev \
        libxslt-dev \
        unzip \
        git 

RUN set -xe \
    && docker-php-source extract \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-xpm-dir=/usr/include/ --enable-gd-native-ttf --enable-gd-jis-conv \
    && docker-php-ext-install exif gd mbstring intl xsl zip mysqli pdo_mysql \
    && docker-php-ext-enable opcache.so \
    && docker-php-source delete 

WORKDIR /var/www

RUN mkdir -p /root/.composer \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD php-fpm

EXPOSE 9000
