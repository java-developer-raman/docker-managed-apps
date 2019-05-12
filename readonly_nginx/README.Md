Donot write on container layer, this can put container into performance problems, use tmpfs instead
===================================================================================================
This is a readonly nginx container i.e we will use tmpfs to keep all the data in memory. Conside using tmpfs when you want to keep sensitive data, but not on filesystem.
But do not write heavy data as it consumes more memory.

docker build -t readonly_nginx:latest (Build the image)

docker container run -p 80:80 --mount type=tmpfs,dst=/data --read-only nginx:latest (Run nginx in a readonly mode, and store data in tmpfs)