create or database globalmart_db;
use database globalmart_db;


create schema bronze;
use schema bronze;

--STORAGE INTEGRATION--
create or replace storage integration s3_globalmart_int
type=external_stage
storage_provider=s3
enabled=true
storage_aws_role_arn='arn:aws:iam::597601766568:role/globalmart'
storage_allowed_locations=('s3://globalmart-data-001/');



--EXTERNAL STAGE--
create or replace stage stg_globalmart
url='s3://globalmart-data-001/'
storage_integration=s3_globalmart_int;

LIST @stg_globalmart;

