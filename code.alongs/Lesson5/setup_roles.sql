USE ROLE USERADMIN;

SELECT current_role();

SELECT current_user();

CREATE ROLE ice_cream_reader COMMENT = 'Able to read ice_cream database';
CREATE ROLE ice_cream_writer COMMENT = 'Able to do CRUD operations on ice_cream database';
CREATE ROLE ice_cream_analyst COMMENT = 'Able to create views on ice_cream database';

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

SHOW GRANTS TO ROLE ice_cream_reader;

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;

GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;
GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;
SHOW GRANTS TO ROLE ice_cream_writer;

USE ROLE ice_cream_writer;

GRANT ROLE ice_cream_writer TO USER JayBodin;

-- Granting access for analyst

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_analyst;

GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_analyst;

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_analyst;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_analyst;

GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT SELECT ON  ALL VIEWS IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT SELECT ON FUTURE VIEWS IN SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE VIEW ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

GRANT CREATE TEMPORARY TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_analyst;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

SHOW GRANTS TO ROLE ice_cream_analyst;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

USE ROLE ice_cream_analyst;