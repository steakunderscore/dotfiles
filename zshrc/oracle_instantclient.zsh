# http://www.oracle.com/technetwork/database/database-technologies/instant-client/overview/index.html
if [[ -d /opt/oracle/instantclient_12_2 ]]
then
  export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2
fi
