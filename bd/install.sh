#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]
then
  echo "USE: $0 server database user"
  echo "Example: $0 localhost panoptes postgres"
else
  echo "Creating database $2"
  psql -h $1 -U postgres -c "CREATE DATABASE $2 WITH OWNER = $3 ENCODING = 'UTF8' TABLESPACE = pg_default;"
  echo "Creating database structure"
  psql -h $1 $2 $3 < bd-panoptes.sql 2> error.log
  echo "Error in file error.log"
fi
#psql -h $1 $2 $3

