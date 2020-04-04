FROM centos:7

ARG buildenv
RUN (test "${buildenv:-prod}" = "dev" && yum -y --setopt=tsflags=nodocs update || :) \
    && yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        httpd \
        mod_wsgi \
        postgresql \
        python2-prewikka \
        preludedb-pgsql \
        python-gevent \
        python2-voluptuous \
        python2-lark-parser \
        python-enum34 \
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

