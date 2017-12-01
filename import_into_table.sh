#!/bin/bash

database_path=~/.kalite/database/data.sqlite
  
sqlite3 $database_path ".mode csv" ".import main_userlog.csv main_userlog"
sqlite3 $database_path ".mode csv" ".import main_userlogsummary.csv main_userlogsummary"
sqlite3 $database_path ".mode csv" ".import main_exerciselog.csv main_exerciselog"
sqlite3 $database_path ".mode csv" ".import main_videolog.csv main_videolog"
sqlite3 $database_path ".mode csv" ".import main_attemptlog.csv main_attemptlog"
sqlite3 $database_path ".mode csv" ".import securesync_facilityuser.csv securesync_facilityuser"