FROM centos:7

ARG buildenv
RUN (test "${buildenv:-prod}" = "dev" && yum -y --setopt=tsflags=nodocs update || :) \
    && yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        postgresql \
        python2-prewikka \
        preludedb-pgsql \
        python-gevent \
        python2-voluptuous \
        python2-lark-parser \
        python-enum34 \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prewikka/    /etc/prewikka/
COPY files/usr/bin/         /usr/bin/

ENTRYPOINT ["start-prelude"]
CMD ["start-prewikka-crontab"]

