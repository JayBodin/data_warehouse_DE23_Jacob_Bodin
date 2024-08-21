USE DATABASE crunchbase_basic_company_data;

SHOW SCHEMAS;

USE SCHEMA PUBLIC;

SHOW TABLES;

SHOW VIEWS;

SELECT * FROM ORGANIZATION_SUMMARY LIMIT 10;

DESCRIBE VIEW organization_summary;

SELECT COUNT(*) AS number_rows FROM ORGANIZATION_SUMMARY;

SELECT DISTINCT type FROM ORGANIZATION_SUMMARY;

SELECT COUNT(DISTINCT name) as number_unique_names FROM ORGANIZATION_SUMMARY;

SELECT COUNT(DISTINCT COUNTRY_CODE) FROM ORGANIZATION_SUMMARY;

SELECT 
    COUNTRY_CODE,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
ORDER BY number_organizations DESC;

SELECT 
    COUNTRY_CODE,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;

SELECT 
    COUNTRY_CODE,
    region,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code, region
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;