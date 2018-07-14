FROM centos

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release

RUN yum -y --setopt=tsflags=nodocs install prelude-lml prelude-lml-rules prelude-tools && \
    yum clean all

COPY files/etc/prelude-lml/ /etc/prelude-lml/
COPY files/etc/prelude/     /etc/prelude/
COPY files/usr/bin/         /usr/bin/

# Syslog receiver
EXPOSE 514/tcp
EXPOSE 514/udp

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-lml"]

