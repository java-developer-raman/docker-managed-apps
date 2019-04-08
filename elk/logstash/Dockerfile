# As suggested in documentation https://www.elastic.co/guide/en/logstash/current/docker-config.html, It is better to create own image to make the things immutable.
FROM docker.elastic.co/logstash/logstash:6.7.1

RUN rm -f /usr/share/logstash/pipeline/logstash.conf

COPY pipeline/logstash.conf /usr/share/logstash/pipeline/
# Some how multiple pipeline is not working, so commenting it
#COPY pipeline/pipelines.yml /usr/share/logstash/pipeline/

COPY config/logstash.yml /usr/share/logstash/config/

# Command to create Docker image
# sudo docker build --tag=ramansharma/logstash:6.7.1 .
# sudo docker push ramansharma/logstash:6.7.1