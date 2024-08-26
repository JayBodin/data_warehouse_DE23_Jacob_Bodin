use role job_ads_dlt_role;

use database job_ads;

show schemas;

show tables in schema staging;

desc table staging.data_field_job_ads;

select headline, employer__workplace
from staging.data_field_job_ads;


select * from staging.data_field_job_ads limit 10;