Problem with normal loadbalancer was if you will provide custom commands through command line, only those custome commands will execute, main script start.sh won't execute.

If you will execute this command, nginx will run normally

sudo docker-compose run lb
******
Output
******
Substitute environment variables
Starting nginx


Now If you will execute below command

sudo docker-compose run lb echo "raman Sharma"
*******
Output
*******
Raman Sharma

So you will see our nginx did not run, as start.sh never ran, only custom command ran.


To fix this problem We need to use Entrypoint. So EntryPoint always run, No matter what is your custom command. So to run the custom commands
passed on commandline, Yo need to use $@ to execute all the arguments passed on CLI