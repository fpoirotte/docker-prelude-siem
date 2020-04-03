FROM centos:7

ARG buildenv
RUN (test "${buildenv:-prod}" = "dev" && yum -y --setopt=tsflags=nodocs update || :) \
    && yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        postgresql \
        preludedb-pgsql \
        python2-prelude-correlator \
        prelude-tools \
        python-netaddr \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prelude-correlator/  /etc/prelude-correlator/
COPY files/etc/prelude/             /etc/prelude/
COPY files/usr/bin/                 /usr/bin/

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-correlator"]

