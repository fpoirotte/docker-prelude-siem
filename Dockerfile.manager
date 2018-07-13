FROM centos

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release

RUN yum -y --setopt=tsflags=nodocs install postgresql prelude-manager prelude-manager-db-plugin preludedb-pgsql prelude-tools && \
    yum clean all

ADD files/etc/prelude-manager   /etc/prelude-manager/
ADD files/usr/bin               /usr/bin/

# Registration server
EXPOSE 5553

# IDMEF alert manager
EXPOSE 4690

ENTRYPOINT ["start-prelude"]
CMD ["start-prelude-manager"]

