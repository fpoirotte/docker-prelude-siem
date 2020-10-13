FROM centos:8

RUN    yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        postgresql \
        preludedb-pgsql \
        python3-passlib \
        python3-prewikka \
        python3-requests \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prewikka/    /etc/prewikka/
COPY files/usr/bin/         /usr/bin/

ENTRYPOINT ["start-prelude"]
CMD ["start-prewikka-crontab"]

