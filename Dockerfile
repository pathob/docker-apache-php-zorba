FROM ubuntu:12.04

MAINTAINER Patrick Hobusch "patrick.hobusch@gmail.com"

# Environment
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_RUN_DIR /var/run/apache2

# Install apache and php packages
RUN apt-get update
RUN apt-get install -y \
    apache2 \
    apache2-utils \
    php5 \
    php5-cli \
    php5-common \
    php5-curl \
    php5-dev \
    php5-gd \
    php5-idn \
    php5-imagick \
    php5-imap \
    php5-mcrypt \
    php5-memcache \
    php5-ps \
    php5-pspell \
    php5-recode \
    php5-snmp \
    php5-tidy \
    php5-xmlrpc \
    php5-xsl \
    php-pear \
    libapache2-mod-php5
 
# Install compiling packages
RUN apt-get install -y \
    python-software-properties \
    build-essential \
    cmake \
    libaccess-bridge-java-jni \
    libcurl4-openssl-dev \
    libicu-dev \
    libpcre3 \
    libpcre3-dev \
    libtidy-dev \
    libxerces-c3.1 \
    libxerces-c-dev \
    libxml2-dev \
    libxslt-dev \
    openjdk-6-jdk \
    python-dev \
    ruby-dev \
    uuid-dev \
    curl \
    swig \
    wget

# Install zorba
RUN add-apt-repository ppa:juan457/zorba
RUN apt-get update
RUN apt-get install zorba-with-language-bindings

# Enable apache modules
RUN a2enmod mod_ssl
RUN a2enmod mod_rewrite

# Expose ports
EXPOSE 80
EXPOSE 443

# Add files and run configure
ADD configure /
RUN chmod +x /configure
RUN /configure

# Run apache
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

