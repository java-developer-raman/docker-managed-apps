FROM debian:buster-slim

RUN apt-get update \
      && apt-get install -y nginx \
      && rm /var/log/nginx/access.log \
      && rm /var/log/nginx/error.log \
      && ln -s /dev/stdout /var/log/nginx/access.log \
      && ln -s /dev/stderr /var/log/nginx/error.log

RUN ln -s /data /var/lib/nginx/body \
    && ln -s /data /var/lib/nginx/proxy \
    && ln -s /data /var/lib/nginx/fastcgi \
    && ln -s /data /var/lib/nginx/uwsgi \
    && ln -s /data /var/lib/nginx/scgi \
    && rm -f /run/nginx.pid \
    && ln -s /data/nginx.pid /run/nginx.pid

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]