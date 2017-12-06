#!/bin/bash

database_path=~/.kalite/database/data.sqlite
  
sqlite3 $database_path ".mode csv" ".import main_userlog.csv main_userlog"
sqlite3 $database_path ".mode csv" ".import main_userlogsummary.csv main_userlogsummary"
sqlite3 $database_path ".mode csv" ".import main_exerciselog.csv main_exerciselog"
sqlite3 $database_path ".mode csv" ".import main_videolog.csv main_videolog"
sqlite3 $database_path ".mode csv" ".import main_attemptlog.csv main_attemptlog"
sqlite3 $database_path ".mode csv" ".import securesync_facilityuser.csv securesync_facilityuser"

function update_user_in_tables(){
	database_path=~/.kalite/database/data.sqlite
	
	#update facility id of all users imported to enable user to login after being migrated

    # securesync_facilityuser - the config table for users
    sqlite3 $database_path "update securesync_facilityuser set facility_id=(select id from securesync_facility),counter=NULL,default_language='en',zone_fallback_id=NULL,signed_by_id=NULL,group_id=NULL,signature=NULL where id='"$1"';"   

    # main_userlogsummary
    sqlite3 $database_path "update main_userlogsummary set counter=NULL,language='en',zone_fallback_id=NULL,signed_by_id=NULL,signature=NULL where user_id='"$1"';"

    # main_attemptlog
    sqlite3 $database_path "update main_attemptlog set counter=NULL,zone_fallback_id=NULL,signed_by_id=NULL,signature=NULL where user_id='"$1"';"

    # main_exerciselog
    sqlite3 $database_path "update main_exerciselog set counter=NULL,completion_counter=NULL,zone_fallback_id=NULL,signed_by_id=NULL,signature=NULL where user_id='"$1"';"

    # main_videolog
    sqlite3 $database_path "update main_videolog set counter=NULL,completion_counter=NULL,zone_fallback_id=NULL,signed_by_id=NULL,signature=NULL where user_id='"$1"';"

	#main_userlog
    sqlite3 $database_path "update main_userlog set language='en' where user_id='"$1"';"
}

learners_migrated=~/migrants.txt
# if file exists
if [ -f "$learners_migrated" ];then
  # loop through each id in file and run function on it
  while IFS='' read -r line || [[ -n "$line" ]]; do  
    update_user_in_tables $line
  done < $learners_migrated
# if file doesnt exist, show error message and exit script
else
  echo "path doesnt exist or you did not enter the complete path"
  exit 1
fi