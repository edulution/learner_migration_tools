## The problem at hand
* Some learners need to be transferred from PLF to PLA and vice versa
* The transferred learners need to be assigned to specific groups

### How we solve it
* git clone https://github.com/techZM/learner_migration_tools.git

#### Beginning with PLA to PLF
* On PLA, Create a file called migrants.txt which contains the user ids of all the learners to be migrated from PLA to PLF. This can be derived from a month end report and filtering all the groups needed under PLA.
The migrants.txt file has no separators. Simply a user_id per line. It looks something like this:
```
08e35b75b9f44df3965d6e1c17ed0c40
0a661a1dcb9e491786f3917f5451d665
0b724a2f9b8c42508422e0be48643016
24aabfe13665453185926c1096f40863
261d5e7edf1a46c8822e0988ff2bb0d2
287dd54b303d4b63a08302d537847271
2dabac99c76b4705b7584888a4c81053
4f68fbb97d1e4e5b8d9df5a3d0c1296c
5a29ad79e462485a8a662ee77f9e92c0

```

* Place the migrants.txt file in the home directory. Then run migrate.sh from the learner_migration tools. This will produce 6 csv files:
```
- main_userlog.csv
- main_userlogsummary.csv
- main_attemptlog.csv
- main_exerciselog.csv
- main_videolog.csv
- securesync_facilityuser.csv
```
* Transfer the learner migration tools directory and all the files in it to the next device (PLF), including the migrants.txt file in the home directory.

* Copy the migrants.txt file to the home directory on PLF

* Run the script import_ into_table.sh. This will import all the csv files into PLF

#### Assign migrated learners to groups
All the migrated learners will be ungrouped. 
Suppose we want to assign a list of learners to group PLF 4a04. The sql to run would be:
```sql
update securesync_facilityuser set group_id = (select id from securesync_facilitygroup where name = 'PLF 4a04') where id in ('2d2a1e7b6b5f4656a0a59cd5ffc69bb6','919f8e53fdd345989f7f6e62a175e07c','93c27d22a2d64744acbb53d81098e8f3','bedd2173b8d04b79aa27749b687aa61b');
```
* Repeat for each group of learners you want to assign
* Delete the migrants.txt file and all the csv files from the learner migration tools directory to start afresh and repeat for PLF to PLA migration

-fim- 
