#!/bin/bash

# Function export rows to csv from all relevant tables without headers
# then delete user from these tables
function extract_user_from_tables(){
    # Path to database users are being extracted from
    database_path=~/.kalite/database/data.sqlite

    # main_userlog
    sqlite3 -csv $database_path "select * from main_userlog where user_id='"$1"';" >> main_userlog.csv
    sqlite3 $database_path "delete from main_userlog where user_id='"$1"';"   

    # main_userlogsummary
    sqlite3 -csv $database_path "select * from main_userlogsummary where user_id='"$1"';" >> main_userlogsummary.csv
    sqlite3 $database_path "delete from main_userlogsummary where user_id='"$1"';"

    # main_attemptlog
    sqlite3 -csv $database_path "select * from main_attemptlog where user_id='"$1"';" >> main_attemptlog.csv
    sqlite3 $database_path "delete from main_attemptlog where user_id='"$1"';"

    # main_exerciselog
    sqlite3 -csv $database_path "select * from main_exerciselog where user_id='"$1"';" >> main_exerciselog.csv
    sqlite3 $database_path "delete from main_exerciselog where user_id='"$1"';"

    # main_videolog
    sqlite3 -csv $database_path "select * from main_videolog where user_id='"$1"';" >> main_videolog.csv
    sqlite3 $database_path "delete from main_videolog where user_id='"$1"';"

    # securesync_facilityuser - the config table for users
    sqlite3 -csv $database_path "select * from securesync_facilityuser where id='"$1"';" >> securesync_facilityuser.csv
    sqlite3 $database_path "delete from securesync_facilityuser where id='"$1"';"
}

# get user input path to file
#read -p 'Please enter the path to the list of students to be migrated:' learners_to_migrate

# Path to csv file containing user_ids of learners to migrate 
learners_to_migrate=~/migrants.txt

# if file exists
if [ -f "$learners_to_migrate" ];then
  # loop through each id in file and run extraction function on each user_id
  while IFS='' read -r line || [[ -n "$line" ]]; do  
    extract_user_from_tables $line
  done < $learners_to_migrate
# if file doesnt exist, show error message and exit script
else
  echo "path doesnt exist or you did not enter the complete path"
  exit 1
fi
