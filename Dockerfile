FROM ubuntu:14.04

ENV IMAGE_UPDATED_AT 20151103
ENV DEBIAN_FRONTEND=noninteractive

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales
ENV LANG en_US.UTF-8

COPY docker/sources.list /etc/apt/sources.list

RUN apt-get update -qq

RUN apt-get install -y sudo python-pip python-setuptools python-imaging python-mysqldb \
    openjdk-7-jre memcached python-memcache pwgen curl openssl poppler-utils libpython2.7 libreoffice \
    libreoffice-script-provider-python ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy nginx wget

RUN apt-get install -y mariadb-server

COPY docker/entry /usr/local/bin/docker-entry

ADD https://bintray.com/artifact/download/seafile-org/seafile/seafile-server_4.4.2_x86-64.tar.gz /opt/

ENTRYPOINT ["/usr/local/bin/docker-entry"]

CMD ["/bin/bash"]
