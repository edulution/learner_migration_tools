#!/bin/bash

# PLA to PLF



# Facility id
# Dataset id
# -------------
# PLF d5f4f07c-2f45-91fc-429e-fc4ac7f33fa7
#	  8931633d-9488-5f81-6e1c-d1ec287d93e8

# PLA b0dd174e-19ac-f227-b429-a11cf0af7acb
#	  60c09ea8-ad78-a061-1d02-3edeba695f05


sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" kolibriauth_facilityuser.csv
sed -i -e "s/b0dd174e-19ac-f227-b429-a11cf0af7acb/d5f4f07c-2f45-91fc-429e-fc4ac7f33fa7/g" kolibriauth_facilityuser.csv


sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" logger_attemptlog.csv
sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" logger_contentsessionlog.csv
sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" logger_contentsummarylog.csv
sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" logger_masterylog.csv
sed -i -e "s/60c09ea8-ad78-a061-1d02-3edeba695f05/8931633d-9488-5f81-6e1c-d1ec287d93e8/g" logger_usersessionlog.csv

sed -i -e "s/60c09ea8ad78a0611d023edeba695f05/8931633d94885f816e1cd1ec287d93e8/g" logger_attemptlog.csv
sed -i -e "s/60c09ea8ad78a0611d023edeba695f05/8931633d94885f816e1cd1ec287d93e8/g" logger_contentsessionlog.csv
sed -i -e "s/60c09ea8ad78a0611d023edeba695f05/8931633d94885f816e1cd1ec287d93e8/g" logger_contentsummarylog.csv
sed -i -e "s/60c09ea8ad78a0611d023edeba695f05/8931633d94885f816e1cd1ec287d93e8/g" logger_masterylog.csv
sed -i -e "s/60c09ea8ad78a0611d023edeba695f05/8931633d94885f816e1cd1ec287d93e8/g" logger_usersessionlog.csv


sed -i -e "s/null//g" logger_usersessionlog.csv




PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY kolibriauth_facilityuser FROM 'kolibriauth_facilityuser.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_contentsummarylog FROM 'logger_contentsummarylog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_masterylog FROM 'logger_masterylog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_contentsessionlog FROM 'logger_contentsessionlog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_attemptlog FROM 'logger_attemptlog.csv' WITH DELIMITER AS ',' CSV HEADER;"
PGPASSWORD=$KOLIBRI_DATABASE_PASSWORD psql -h "$KOLIBRI_DATABASE_HOST" -U "$KOLIBRI_DATABASE_USER" -d "$KOLIBRI_DATABASE_NAME" -p "$KOLIBRI_DATABASE_PORT" -t -A -F"," -c "\COPY logger_usersessionlog FROM 'logger_usersessionlog.csv' WITH DELIMITER AS ',' CSV HEADER;"