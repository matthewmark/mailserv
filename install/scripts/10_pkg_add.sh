#!/bin/sh

if [ X"$PKG_PATH" == X"" ]; then
  export PKG_PATH=http://ftp.OpenBSD.org/pub/OpenBSD/`uname -r`/packages/`uname -m`/
  grep PKG_PATH /etc/profile || echo "export PKG_PATH=http://ftp.OpenBSD.org/pub/OpenBSD/`uname -r`/packages/`uname -m`/" >> /etc/profile
fi

case $1 in

  (install):
    echo "Installing packages"
    mkdir /var/db/spamassassin 2>/dev/null
    cat <<__EOT
    
You will be prompted to install:
 - postfix version. The recommendation is to install the first version 

Fetching versions:

__EOT
    pkg_add -v -m -I \
     postfix-2.11.1p0-mysql \
     clamav \
     gnupg-2.0.22p0 \
     p5-Mail-SPF \
     p5-Mail-SpamAssassin \
     ruby-gems-1.8.23p2 \
     ruby-rake-0.9.2.2p0 \
     ruby-rrd \
     ruby-mysql-2.8.1p16 \
     ruby-mongrel \
     ruby-fastercsv-1.5.4p2 \
     ruby-iconv \
     god \
     dnsmasq \
     dovecot-pigeonhole \
     dovecot-mysql \
     memcached \
     mysql-server \
     nginx-1.5.7p3 \
     sqlgrey \
     gsed \
     gtar \
     php-5.5.14p0 \
     php-fpm-5.5.14 \
     php-mysqli-5.5.14 \
     php-pdo_mysql-5.5.14 \
     php-gd-5.5.14 \
     php-mcrypt-5.5.14 \
     ghostscript-fonts \
     ghostscript--no_x11 \
     ImageMagick \
     pecl-APC \
     pecl-memcache \
     lynx
     ;;

esac
