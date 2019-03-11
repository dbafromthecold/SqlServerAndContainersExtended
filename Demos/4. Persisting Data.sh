
# https://dbafromthecold.com/2017/06/28/persisting-data-in-docker-containers-part-two/



# remove unused volumes
docker volume prune



# check volumes
docker volume ls



# create the named volume
docker volume create sqlserver



# verify named volume is there
docker volume ls



# spin up a container with named volume mapped
docker run -d -p 15999:1433 \
-v sqlserver:/sqlserver \
--env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122 \
--name testcontainer3 \
mcr.microsoft.com/mssql/server:2019-CTP2.3-ubuntu



# check the container is running
docker ps -a



# create database on the named volume
mssql-cli -S 'localhost,15999' -U sa -P Testing1122 

CREATE DATABASE [DatabaseB] ON PRIMARY (NAME = N'DatabaseB', FILENAME = N'/sqlserver/DatabaseB.mdf') LOG ON (NAME = N'DatabaseB_log', FILENAME = N'/sqlserver/DatabaseB_log.ldf');

                

# check the database is there
SELECT [name] FROM sys.databases;



# create a test table and insert some data
USE [DatabaseB];

CREATE TABLE dbo.TestTable(ID INT);

INSERT INTO dbo.TestTable(ID) SELECT TOP 200 1 FROM sys.all_columns;



# query the test table
SELECT COUNT(*) AS Records FROM dbo.TestTable;



EXIT



# blow away container
docker kill testcontainer3
docker rm testcontainer3



# check that named volume is still there
docker volume ls



# spin up another container
docker run -d -p 16100:1433 \
-v sqlserver:/sqlserver \
--env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122 \
--name testcontainer4 \
mcr.microsoft.com/mssql/server:2019-CTP2.3-ubuntu



# verify container is running
docker ps -a



# connect to the sql instance
mssql-cli -S 'localhost,16100' -U sa -P Testing1122



# now attach the database
CREATE DATABASE [DatabaseB] ON (FILENAME = '/sqlserver/DatabaseB.mdf'),(FILENAME = '/sqlserver/DatabaseB_log.ldf') FOR ATTACH;



# check database is there
SELECT [name] FROM sys.databases;



# query the test table       
USE [DatabaseB];

SELECT COUNT(*) AS Records FROM dbo.TestTable;



EXIT



# clean up
docker kill testcontainer4
docker rm testcontainer4
docker volume rm sqlserver