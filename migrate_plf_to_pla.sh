#!/bin/bash

# PLF to PLA


PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from kolibriauth_facilityuser where id in ) TO 'kolibriauth_facilityuser.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from logger_attemptlog where user_id in ) TO 'logger_attemptlog.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from logger_contentsessionlog where user_id in ) TO 'logger_contentsessionlog.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from logger_contentsummarylog where user_id in ) TO 'logger_contentsummarylog.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from logger_masterylog where user_id in ) TO 'logger_masterylog.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -c "\COPY (select * from logger_usersessionlog where user_id in ) TO 'logger_usersessionlog.csv' DELIMITER ',' CSV HEADER;"


# Facility id
# Dataset id
# -------------
# PLF d5f4f07c-2f45-91fc-429e-fc4ac7f33fa7
#	  8931633d-9488-5f81-6e1c-d1ec287d93e8

# PLA b0dd174e-19ac-f227-b429-a11cf0af7acb
#	  60c09ea8-ad78-a061-1d02-3edeba695f05

# Replace facility_id
sed -i -e "s/d5f4f07c-2f45-91fc-429e-fc4ac7f33fa7/b0dd174e-19ac-f227-b429-a11cf0af7acb/g" kolibriauth_facilityuser.csv
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" kolibriauth_facilityuser.csv

# Replace Dataset ID and morango partition
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" logger_attemptlog.csv
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" logger_contentsessionlog.csv
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" logger_contentsummarylog.csv
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" logger_masterylog.csv
sed -i -e "s/8931633d-9488-5f81-6e1c-d1ec287d93e8/60c09ea8-ad78-a061-1d02-3edeba695f05/g" logger_usersessionlog.csv

sed -i -e "s/8931633d94885f816e1cd1ec287d93e8/60c09ea8ad78a0611d023edeba695f05/g" logger_attemptlog.csv
sed -i -e "s/8931633d94885f816e1cd1ec287d93e8/60c09ea8ad78a0611d023edeba695f05/g" logger_contentsessionlog.csv
sed -i -e "s/8931633d94885f816e1cd1ec287d93e8/60c09ea8ad78a0611d023edeba695f05/g" logger_contentsummarylog.csv
sed -i -e "s/8931633d94885f816e1cd1ec287d93e8/60c09ea8ad78a0611d023edeba695f05/g" logger_masterylog.csv
sed -i -e "s/8931633d94885f816e1cd1ec287d93e8/60c09ea8ad78a0611d023edeba695f05/g" logger_usersessionlog.csv



PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY kolibriauth_facilityuser FROM 'kolibriauth_facilityuser.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_contentsummarylog FROM 'logger_contentsummarylog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_masterylog FROM 'logger_masterylog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_contentsessionlog FROM 'logger_contentsessionlog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_attemptlog FROM 'logger_attemptlog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_usersessionlog FROM 'logger_usersessionlog.csv' WITH DELIMITER AS ',' CSV HEADER;"