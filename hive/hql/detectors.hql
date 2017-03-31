#Insert a table with String as data type
create if not exists
table admin_detectors
(detector_id string, 
detector_name string, 
country string, 
latitude string, 
longitude string) 
row format
delimited fields terminated by ','  ;

#Load data from sqoop import
load data inpath '/user/hdfs/ADMIN.DETECTORS/part-m-00000' into table batch.admin_detectors

#Create a parquet table
create if not exists
table admin_detectors_fmt
(detector_id int, 
detector_name string, 
country string, 
latitude float, 
longitude float) 
row format
delimited fields terminated by ',' 
stored as parquet;


#Insert  data into parquet table
 insert into table admin_detectors_fmt 
 select * 
 from admin_detectors;

