
# https://dbafromthecold.com/2017/02/08/sql-container-from-dockerfile/



# check local repository
docker images



# build custom image
Filepath = ~/git/SQLServerAndContainersDemo/Dockerfiles/Dockerfile1
docker build -t testimage1 $Filepath



# check local repository
docker images



# run container from custom image
docker run -d -p 15555:1433 \
    --name testcontainer5 \
        testimage1



# check container is running
docker ps -a



# connect to sql instance
mssql-cli -S localhost,15555 -U sa



# check databases
select name from sys.databases;



# exit mssql-cli
exit


# clean up
docker rm $(docker ps -a -q) -f

docker rmi testimage2
