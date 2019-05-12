FROM debian:buster-slim

ARG NGINX_PKG_TYPE=full
ENV NGINX_PKG=nginx-${NGINX_PKG_TYPE:-full}

RUN apt-get update \
      && apt-get install -y $NGINX_PKG \
      && apt-get install gettext-base \
      && rm -rf /var/lib/apt/lists/* \
      && rm /var/log/nginx/access.log \
      && rm /var/log/nginx/error.log \
      && ln -s /dev/stdout /var/log/nginx/access.log \
      && ln -s /dev/stderr /var/log/nginx/error.log

#Basically we are copying file as a template, then envsubst script will fill the placeholders and create default file here
COPY proxy.conf /etc/nginx/sites-available/default.template
COPY start.sh /

#CMD ["/start.sh"]

#Script will be executed always, no matter if you provided command through CLI or not
ENTRYPOINT ["/start.sh"]
# So this is the default command, which will run if no custom command is provided via CLI
CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80

STOPSIGNAL SIGQUIT
