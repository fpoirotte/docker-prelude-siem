FROM centos:8

RUN    yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        postgresql \
        preludedb-pgsql \
        python3-prelude-correlator \
        prelude-tools \
        python3-netaddr \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prelude-correlator/  /etc/prelude-correlator/
COPY files/etc/prelude/             /etc/prelude/
COPY files/usr/bin/                 /usr/bin/

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-correlator"]

