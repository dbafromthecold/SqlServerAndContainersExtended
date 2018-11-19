
# https://dbafromthecold.com/2017/06/28/persisting-data-in-docker-containers-part-two/

## Named Volumes



# remove unused volumes
docker volume prune



# create the named volume
docker volume create sqlserver



# verify named volume is there
docker volume ls



# spin up a container with named volume mapped
docker run -d -p 15999:1433 \
    -v sqlserver:/sqlserver \
        --env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122 \
            --name testcontainer9 \
                microsoft/mssql-server-linux:latest



# check the container is running
docker ps -a



# create database on the named volume
mssql-cli -S 'localhost,15999' -U sa -P Testing1122 

CREATE DATABASE [DatabaseE]
ON PRIMARY
    (NAME = N'DatabaseE', FILENAME = N'/sqlserver/DatabaseE.mdf')
LOG ON
    (NAME = N'DatabaseE_log', FILENAME = N'/sqlserver/DatabaseE_log.ldf');

                

# check the database is there
SELECT [name] FROM sys.databases;



# create a test table and insert some data
USE [DatabaseE];

CREATE TABLE dbo.TestTable2(ID INT);

INSERT INTO dbo.TestTable2(ID) SELECT TOP 200 1 FROM sys.all_columns;



# query the test table
SELECT COUNT(*) AS Records FROM dbo.TestTable2;



EXIT



# blow away container
docker kill testcontainer9
docker rm testcontainer9



# check that named volume is still there
docker volume ls



# spin up another container
docker run -d -p 16100:1433 \
    -v sqlserver:/sqlserver \
        --env ACCEPT_EULA=Y --env SA_PASSWORD=Testing1122 \
            --name testcontainer10 \
                microsoft/mssql-server-linux:latest



# verify container is running
docker ps -a



# now attach the database
mssql-cli -S 'localhost,16100' -U sa -P Testing1122

CREATE DATABASE [DatabaseE] ON 
(FILENAME = '/sqlserver/DatabaseE.mdf'),
(FILENAME = '/sqlserver/DatabaseE_log.ldf') FOR ATTACH;



# check database is there
SELECT [name] FROM sys.databases;



# query the test table       
USE [DatabaseE];

SELECT COUNT(*) AS Records FROM dbo.TestTable2;



EXIT



# clean up
docker kill testcontainer10
docker rm testcontainer10
docker volume rm sqlserver