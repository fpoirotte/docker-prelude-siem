FROM centos

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install epel-release

RUN yum -y --setopt=tsflags=nodocs install httpd postgresql prewikka preludedb-pgsql mod_wsgi && \
    yum clean all && \
    mv /usr/share/prewikka/prewikka.wsgi /var/www/html/

ADD files/etc/prewikka  /etc/prewikka/
ADD files/usr/bin/      /usr/bin/
ADD files/etc/httpd     /etc/httpd/

EXPOSE 80

ENTRYPOINT ["start-prelude"]
CMD ["start-prewikka"]

