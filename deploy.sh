aws ecr get-login-password --region ap-south-1 | aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 855991486920.dkr.ecr.ap-south-1.amazonaws.com
docker pull 855991486920.dkr.ecr.ap-south-1.amazonaws.com/docker-application:$1
echo "docker pull succeeded"
docker ps -a
echo "previous commands shows if existing docker is present or not"
docker rm -f dotnet-app
echo "previous show if it is there it gets deleted "
docker ps -a
echo "empty docker"
docker run -itd -p 3000:3000 --name dotnet-app 754495971822.dkr.ecr.ap-southeast-1.amazonaws.com/docker1:$1
docker ps -a
