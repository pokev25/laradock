FROM dockercloud/haproxy

MAINTAINER appkr <juwonkim@me.com>

RUN echo "listen stats *:8001" >> etc/haproxy/haproxy.cfg \
    && echo "    stats enable" >> etc/haproxy/haproxy.cfg \
    && echo "    stats uri /" >> etc/haproxy/haproxy.cfg \
    && echo "    stats hide-version" >> etc/haproxy/haproxy.cfg \
    && echo "    stats auth homestead:secret" >> etc/haproxy/haproxy.cfg \