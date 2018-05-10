FROM library/debian:stretch

RUN     apt-get update && \
        apt-get -y install libapache2-mod-php7.0 && \
#        rm /var/www/html/*html && \
        ln -sf /dev/stdout /var/log/apache2/access.log && \
        ln -sf /dev/sterr /var/log/apache2/error.log && \
        rm -rf /var/lib/apt/* /var/lib/dpkg/* /var/cache/debconf/* /usr/locale/* /usr/doc*
COPY    index.html /var/www/html

EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apachectl", "-D", "FOREGROUND" ]
