
# https://dbafromthecold.com/2016/11/16/sql-server-containers-part-one/



# verify docker is responding to commands
docker version



# pull image down to local repository
docker pull mcr.microsoft.com/mssql/server:2019-CTP2.3-ubuntu



# verify image is in repository
docker images



# run a container
docker run -d -p 15111:1433 \
--env ACCEPT_EULA=Y \
--env SA_PASSWORD=Testing1122 \
--name testcontainer1 \
mcr.microsoft.com/mssql/server:2019-CTP2.3-ubuntu



# verify container is running
docker ps -a



# cool! container is running. Checking the logs...
docker logs testcontainer1



# connect to sql instance
mssql-cli -S 'localhost,15111' -U sa -P Testing1122



# get sql version
SELECT @@VERSION;



# exit mssql-cli
exit



# let's have a look within the container
docker exec -it testcontainer1 bash



# navigate to directory
cd /var/opt/mssql/data



# list directory contents
ls -al



# exit container
exit



# copy a backup file into the container
docker cp ~/git/SqlServerAndContainersExtended/DatabaseBackup/DatabaseA.bak \
testcontainer1:/var/opt/mssql/data/


 
# check that the backup file is there
docker exec -it testcontainer1 bash



# navigate to directory
cd /var/opt/mssql/data



# list directory contents
ls -al



# exit container
exit


# connect to sql instance
mssql-cli -S 'localhost,15111' -U sa -P Testing1122



# restore database in container          
RESTORE DATABASE [DatabaseA] FROM DISK = '/var/opt/mssql/data/DatabaseA.bak'



# check databases in container
select name from sys.databases;



# exit mssql-cli
exit


    
# clean up
docker rm $(docker ps -a -q) -f
