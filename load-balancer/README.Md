Using containers approach
=========================
1. Create containers by invoking this command multiple times
   sudo docker run -d --network-alias webapp --network load nginx:latest
2. Invoke load balancer, by specifying environment variables to point to webapp, which is the network alias for all the containers
   sudo docker run -p 80:80 -e PROXY_PROTOCOL=http -e PROXY_UPSTREAM=webapp  --network load lb:latest

Using docker-compose
====================
sudo docker-compose up -d webapp
sudo docker-compose up -d --scale webapp=3 (If docker-compose.yml does not have replica information)
sudo docker-compse up lb