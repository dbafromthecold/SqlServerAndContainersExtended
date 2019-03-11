sleep 15s
 
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Testing1122 \
-Q "CREATE DATABASE [DatabaseA] ON (FILENAME = '/var/opt/sqlserver/DatabaseA.mdf'),(FILENAME = '/var/opt/sqlserver/DatabaseA_log.ldf') FOR ATTACH"