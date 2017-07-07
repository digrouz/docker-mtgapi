FROM centos:latest
LABEL maintainer "DI GREGORIO Nicolas <ndigrego@ndg-consulting.tech>"

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN yum install -y centos-release-scl.noarch && \
    yum install -y rh-python35-python pcre && \
    yum install -y wget rh-python35-python-devel gcc git pcre-devel && \
    . /opt/rh/rh-python35/enable && \
    pip3 install uwsgi flask && \
    git clone --depth 1 https://github.com/digrouz/mtgapi /opt/mtgapi && \
    yum history -y undo last && \
    yum clean all && \
    rm -rf /tmp/* \
           /opt/mtgapi/.git* \
           /var/cache/yum/* \
           /var/tmp/*
    
# Expose volumes
#VOLUME []

# Expose ports
EXPOSE 6666

### Running User: not used, managed by docker-entrypoint.sh
#USER mtgapi

### Start mtgapi
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["mtgapi"]
