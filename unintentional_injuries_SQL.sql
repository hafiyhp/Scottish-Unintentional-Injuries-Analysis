-- Database: Unintentional_injuries_NHS

-- DROP DATABASE IF EXISTS "Unintentional_injuries_NHS";

CREATE DATABASE "Unintentional_injuries_NHS"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	

CREATE TABLE modified_admissions (
    FinancialYear VARCHAR,
    CA VARCHAR,
    AgeGroup VARCHAR,
    Sex VARCHAR,
    InjuryLocation VARCHAR,
    InjuryType VARCHAR,
    NumberOfAdmissions INTEGER
);

COPY modified_admissions FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_admissions.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM modified_admissions LIMIT 10;

CREATE TABLE modified_council_health_board (
    CA VARCHAR,
    CAName VARCHAR,
    HBName VARCHAR,
    Country VARCHAR
);

COPY modified_council_health_board FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_council_health_board.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM modified_council_health_board;

-- Create a new table from the result of the join
SELECT *
INTO merged_data
FROM modified_admissions
JOIN modified_council_health_board ON modified_admissions.CA = modified_council_health_board.CA;

SELECT modified_admissions.FinancialYear, modified_admissions.CA, modified_admissions.AgeGroup, modified_admissions.Sex, modified_admissions.InjuryLocation, modified_admissions.InjuryType, modified_admissions.NumberOfAdmissions,
       modified_council_health_board.CAName, modified_council_health_board.HBName, modified_council_health_board.Country
INTO merged_data
FROM modified_admissions
JOIN modified_council_health_board ON modified_admissions.CA = modified_council_health_board.CA;

SELECT * FROM merged_data;

COPY merged_data TO 'C:/Program Files/PostgreSQL/16/data/Data_copy/merged_data.csv' DELIMITER ',' CSV HEADER;
