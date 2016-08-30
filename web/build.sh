
# Set correct environment variables.
set -ex

export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive
export TERM=dumb

apt-get update && apt-get --no-install-recommends -y upgrade

apt-get install --no-install-recommends -y \
    supervisor \
    nginx \
    libpq-dev \
    libmemcached-dev \
    curl;

# Install extensions using the helper script provided by the base image
docker-php-ext-install \
    pdo_mysql \
    pdo_pgsql;

# Install Memcached for php 7
curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
    && mkdir -p /usr/src/php/ext/memcached \
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    && rm /tmp/memcached.tar.gz;

# Install xdebug
pecl install xdebug \
    && docker-php-ext-enable xdebug;

# echo "upstream php-upstream { server web:9000; }" > /etc/nginx/conf.d/upstream.conf
rm /etc/nginx/sites-available/default

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
