FROM centos:8

RUN    yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        httpd \
        postgresql \
        python3-mod_wsgi \
        python3-passlib \
        python3-requests \
    && yum -y --setopt=tsflags=nodocs install --enablerepo=epel-testing \
        preludedb-pgsql \
        python3-prewikka \
    && mv /usr/share/prewikka/prewikka.wsgi /var/www/html/ \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN ln -sf /proc/self/fd/1 /var/log/httpd/access_log && \
    ln -sf /proc/self/fd/1 /var/log/httpd/error_log

COPY files/etc/prewikka/    /etc/prewikka/
COPY files/usr/bin/         /usr/bin/
COPY files/etc/httpd/       /etc/httpd/

EXPOSE 80

ENTRYPOINT ["start-prelude"]
CMD ["start-prewikka"]

