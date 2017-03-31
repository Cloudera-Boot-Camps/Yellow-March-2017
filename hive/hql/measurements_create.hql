#create table after sqoop import
create table if not exists batch.admin_measurements
(measurement_id string,
detector_id string,
galaxy_id string,
astrophysicist_id string,
measurement_time string,
amplitude_1 string, 
amplitude_2 string,
amplitude_3 string)
row format 
delimited fields terminated by ',' ;

#create parquet for stage II load
create table if not exists batch.admin_measurements_par
(measurement_id string,
detector_id int, 
galaxy_id int, 
astrophysicist_id int, 
measurement_time int, 
amplitude_1 float, 
amplitude_2 float, 
amplitude_3 float) 
row format 
delimited fields terminated by ','
stored as parquet;



#loading data into parquet table
insert into table batch.admin_measurements_par
select measurement_id, 
cast(detector_id as int), 
cast(galaxy_id as int), 
cast(astrophysicist_id as int), 
cast(measurement_time as int), 
cast(amplitude_1 as float), 
cast(amplitude_2 as float), 
cast(amplitude_3 as float) 
from batch.admin_measurements
