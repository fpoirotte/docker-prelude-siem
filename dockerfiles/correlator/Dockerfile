FROM centos

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release

RUN yum -y --setopt=tsflags=nodocs install prelude-correlator prelude-tools python34-netaddr && \
    yum clean all

COPY files/etc/prelude-correlator/  /etc/prelude-correlator/
COPY files/etc/prelude/             /etc/prelude/
COPY files/usr/bin/                 /usr/bin/

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-correlator"]

