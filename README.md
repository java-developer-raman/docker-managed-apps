# docker-managed-apps

## Docker security tips Do's and Don'ts
1. If you can pay, try to use Docker EE Edition. Always check CVE vulnerabilities of the image which you are using. And also get it checked your own images. ALways pull or push the trusted signed images https://docs.docker.com/engine/security/trust/content_trust/

2. Always use official images, Avoid predefined images from docker hub. If possible always use a base image e.g. Ubuntu or debian and do all other things you need on top of that .

3. Try to pull images through sha, As it remains unique. It is possible to have more than one image per tag. But sha will be unique. e.g. docker pull alpine@sha:<shaid>

4. By default docker daemon is not open for tcp connections. It just litens on unix socket. Just try to avoid tcp connections. As in that case a remote user can get access of root of docker#s host machine. But If you still want. Then make the connection secure via SSL (https://docs.docker.com/engine/security/https/). Also to make the docker listen to tcp  and doing any firewall changes please use this page https://docs.docker.com/install/linux/linux-postinstall/#configure-where-the-docker-daemon-listens-for-connections

5. Run docker image with a specific user, without using root. Define a new user in image like this
__USER rs__, And run docker with a specifc uid and gid e.g. __docker run --user=5000:5000 --security-opt=no-new-privileges -it alpine:latest__, It will define a user in docker image which has special uid and gid. Refer this page https://docs.docker.com/engine/security/userns-remap/. Print names:  effective id __id -un__ and print real id __id -unr__

6. Use __seecomp__ to block some actions in container. Check on https://docs.docker.com/engine/security/seccomp/
``docker run --rm \
             -it \
             --security-opt seccomp=/path/to/seccomp/profile.json \
             hello-world``
It will block actions defined in profile.json. Sometimes you many need to trace the system calls, and need to update your json, because each operating system fires different system calls. Use __strace linux command__ to do that, and update your json file with the command. __sudo apt install strace__ 

7. Or Use AppArmor profile to deny cerain actions. Please check https://docs.docker.com/engine/security/apparmor/

8. You can limit cpu cycles or shares and limit memory, so that any evil user cannot disturb the whole system.

9. Store your secrets in hashicorp.



