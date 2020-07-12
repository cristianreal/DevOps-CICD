docker stop $(docker ps -aq)
cd /home/elmerreal/DevOps-CI-CD/code/backend
docker build -t christianreal/node-server .
docker run --env-file env.list -p 5000:5000 -d christianreal/node-server
#cd /home/elmerreal/DevOps-CI-CD/code/client
#docker build -t christianreal/vue-client .
#docker run --env-file env.list -p 8086:80 -d christianreal/vue-client
