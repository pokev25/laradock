FROM php:7.0-fpm

MAINTAINER appkr <juwonkim@me.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

COPY build.sh ${HOME}/build.sh
RUN chmod 755 ${HOME}/build.sh
RUN ${HOME}/build.sh

ADD nginx.conf /etc/nginx/
ADD php.ini /usr/local/etc/php/conf.d
ADD fpm.conf /usr/local/etc/php-fpm.d/
ADD laravel.conf /etc/nginx/sites-available/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN usermod -u 1000 www-data

WORKDIR /var/www/laravel

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]