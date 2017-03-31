#Insert a table with String as data type
create table admin_astrophysicists 
( astrophysicist_id string, 
astrophysicist_name string, 
year_of_birth string, 
nationality string) 
row format
delimited fields terminated by ',' ;

#Load data from sqoop import
load data inpath "/user/ec2-user/batch/astrophysicists/part-m-00000" into table batch.admin_astrophysicists;

#Create a parquet table
create table admin_astrophysicists_par 
( astrophysicist_id int, 
astrophysicist_name string, 
year_of_birth int, 
nationality string) 
row format
delimited fields terminated by ',' 
stored as parquet;

#Insert  data into parquet table
 insert into table admin_astrophysicists_par 
 select cast(astrophysicist_id as int), 
 astrophysicist_name, 
 cast(regexp_replace(year_of_birth,"null","9999") as int),
 nationality  
 from admin_astrophysicists;

