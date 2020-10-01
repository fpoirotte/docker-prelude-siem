FROM centos:8

RUN    yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        postgresql \
    && yum -y --setopt=tsflags=nodocs install --enablerepo=epel-testing \
        prelude-manager \
        prelude-manager-db-plugin \
        prelude-tools \
        preludedb-pgsql \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY files/etc/prelude-manager/ /etc/prelude-manager/
COPY files/usr/bin/             /usr/bin/

# 4690 = IDMEF alert manager
# 5553 = Registration server
EXPOSE 4690 5553

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-manager"]

