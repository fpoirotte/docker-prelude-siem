FROM centos:8

RUN    yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        prelude-lml \
        prelude-lml-rules \
        prelude-tools \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prelude-lml/ /etc/prelude-lml/
COPY files/etc/prelude/     /etc/prelude/
COPY files/usr/bin/         /usr/bin/

# Syslog receiver
EXPOSE 514/tcp 514/udp

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-lml"]

