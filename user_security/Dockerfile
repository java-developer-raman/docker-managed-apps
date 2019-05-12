# An example of security lapses, Bydefault docker run all the prcesses as root user, so all scripts can access all data
FROM alpine:3.9.3

COPY data.txt /var/local

RUN chmod 700 /var/local/data.txt

RUN adduser -u 1000 -D rs

COPY evil.sh /bin/
RUN chown rs /bin/evil.sh

# So here if we will comment below line, script will be executed as root user and can access /var/local/data.txt
# That is why always run all the scripts as a normal user instead of root user
USER rs
CMD /bin/evil.sh