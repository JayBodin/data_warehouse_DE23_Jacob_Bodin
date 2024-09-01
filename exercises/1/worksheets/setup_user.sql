USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = dev_wh;