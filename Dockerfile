FROM samirkherraz/alpine-s6

ENV ROOT_PASSWORD=password

RUN set -x \
    && apk add --no-cache mariadb  mariadb-client nginx php7-fpm php7-session php7-mbstring phpmyadmin \
    && rm /etc/nginx/conf.d/default.conf \
    && mkdir /run/nginx \
    && chown nginx:nginx /run/nginx \
    && mkdir /run/mysqld/ /var/log/mysql -p \
    && chown mysql:mysql /run/mysqld  /var/log/mysql

ADD conf/ /

RUN set -x \
    && chown -R nginx:nginx /etc/phpmyadmin \
    && chmod +x /etc/cont-init.d/* \
    && chmod +x /etc/s6/services/*/*
