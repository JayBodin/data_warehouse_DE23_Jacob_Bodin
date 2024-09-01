use role securityadmin;

CREATE ROLE IF NOT EXISTS marketing_dlt_role;

grant usage on warehouse marketing_wh to marketing_dlt_role;

grant usage on database ifood to role marketing_dlt_role;

grant usage on schema ifood.staging to role marketing_dlt_role;

show grants on schema ifood.staging;

SHOW GRANTS TO USER extract_loader;

SHOW GRANTS TO ROLE marketing_dlt_role;
