FROM coincan/coinos:3.8
MAINTAINER CoinCan <inputx@goodays.com>

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="PHP on ARM platform" \
    org.label-schema.description="alpine3.8, php7.2, composer1.16" \
    org.label-schema.url="https://github.com/coincan/php" \
    org.label-schema.vendor="CoinCan (inputx@goodays.com)" \
    org.label-schema.license="GPLv2" \
    org.label-schema.build-date="20181229"

RUN apk add --update git \
		ca-certificates \
		php7-cli \
		php7-fpm \
		php7-common \
		php7-curl \
		php7-gd \
		php7-mysqlnd \
		php7-imap \
		php7-pdo_mysql \
		php7-xml \
		php7-mcrypt \
		php7-mbstring \
		php7-bcmath \
		php7-json \
		php7-phar \
		php7-fileinfo \
		php7-dom \
		php7-simplexml \
		php7-sqlite3 \
		php7-tokenizer \
		php7-xmlwriter \
		php7-iconv \
		php7-redis \
		php7-session \ 
		composer && \
		addgroup -S www-data && adduser -S www-data -G www-data && \
		rm -rf /var/cache/apk/* && \
		composer global require "hirak/prestissimo" -v && \
		composer clearcache

ENV PATH="/root/.composer/vendor/bin:${PATH}"

CMD ["/usr/sbin/php-fpm7", "-F", "-R"]
