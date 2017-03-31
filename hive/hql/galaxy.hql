#Insert a table with String as data type
create table if not exists
batch.admin_galaxies
(galaxy_id string, 
galaxy_name string,
galaxy_type string,
distance_ly string, 
absolute_magnitude string, 
apparent_magnitude string, 
galaxy_group string)
row format 
delimited fields terminated by ',';

#Load data from sqoop import
load data inpath "/user/ec2-user/batch/galaxies/part-m-00000" into table batch.admin_galaxies;

#Create a parquet table
create table if not exists 
batch.admin_galaxies_par 
(galaxy_id int, 
galaxy_name string, 
galaxy_type string, 
distance_ly float, 
absolute_magnitude float, 
apparent_magnitude float, 
galaxy_group string)
row format 
delimited fields terminated by ',' 
stored as parquet;

#Insert galaxy data into parquet table
insert into table batch.admin_galaxies_par 
select galaxy_id,
galaxy_name, 
galaxy_type, 
cast(isnull(distance_ly,"0.000000") as float)
,cast(isnull(absolute_magnitude,"0.00000") as float),
cast(isnull(apparent_magnitude,"0.00000") as float), 
galaxy_group  
from admin_galaxies;
