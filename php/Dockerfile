FROM php:8.2.0-fpm-alpine3.17

RUN if [[ -n "$http_proxy" ]] ; then pear config-set http_proxy ${http_proxy}; fi

RUN apk --no-cache --virtual .opcache add --update \
&& NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
&& docker-php-ext-install -j${NPROC} opcache \
&& apk del .opcache

RUN apk --no-cache --virtual .fcgi add --update \
&& apk --no-cache add fcgi \
&& apk del .fcgi

RUN apk --no-cache --virtual .xdebug add --update autoconf build-base linux-headers \
&& pecl install xdebug-3.2.0 && docker-php-ext-enable xdebug \
&& apk del .xdebug

RUN apk --no-cache --virtual .dbgpProxy add --update wget \
&& apk --no-cache add libc6-compat \
&& wget -O /usr/bin/dbgpProxy https://xdebug.org/files/binaries/dbgpProxy \
&& chmod 755 /usr/bin/dbgpProxy \
&& apk del .dbgpProxy

COPY --from=composer:2.4.4 /usr/bin/composer /usr/bin/composer

HEALTHCHECK --start-period=5s --timeout=5s --interval=5s --retries=5 CMD cgi-fcgi -bind -connect 127.0.0.1:9000 | grep "X-Powered-By: PHP" || exit -1

ARG UNAME=udocker
ARG UID=1000
ARG GNAME=$UNAME
ARG GID=1000
ARG GROUPS=$GNAME

RUN addgroup -S $GNAME --gid $GID \
&& adduser -S $UNAME -G $GNAME --uid $UID
USER $UNAME
WORKDIR /var/www/html

# php-fpm port
EXPOSE 9000

# dbgpProxy port
EXPOSE 9001

# xdebug 3 port
EXPOSE 9003

ENTRYPOINT ["php-fpm"]
