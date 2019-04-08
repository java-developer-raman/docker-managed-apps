How to Run ELK Stack
====================
sudo docker swarm init --advertise-addr 192.168.2.104 (Here 192.168.2.104 is my machine's IP)
sudo docker stack deploy -c docker-elk-compose.yml elk

How to Stop ELK Stack
=====================
sudo docker stack rm elk

192.168.2.104 -- It is my machine's URL, Please change it to your.

Kibana URL: http://192.168.2.104:5601 (Please note first time you need to create logstash index via management gui on left side of Kibana Menu)
Elasticsearch indices : http://192.168.2.104:9200/_cat/indices?v

Notes:
======
If you are changing anything in logstash pipeline under logstash/pipeline/logstash.conf. Please create the image again via this command
 sudo docker build --tag=ramansharma/logstash:6.7.1 logstash/ (If you are in elk directory where compose file is)

Then change the image name in docker-elk-compose.yml file. And then start elk again