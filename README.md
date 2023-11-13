# Scottish Unintentional Injuries Analysis

## Overview

This project aims to analyze unintentional injuries data in Scotland using a combination of SQL and Python. The dataset, sourced from NHS statistics, provides valuable insights into admissions, causes, and trends related to unintentional injuries.

## Data Source

The dataset used in this project is available from Scottish Health and Social Care Open Data website [for unintentional injuries admissions](https://www.opendata.nhs.scot/dataset/unintentional-injuries/resource/aee43295-2a13-48f6-bf05-92769ca7c6cf) and [for Council Area 2011 - Council Area 2019](https://www.opendata.nhs.scot/dataset/geography-codes-and-labels).

## Project Structure

The project is organized into the following directories:

- `/data`: Contains the raw and modified CSV files.
- `/scripts`: Includes SQL scripts for database creation.
- `/visualizations`: Stores the generated plots and visualizations.
- `/docs`: Contains documentation files.

## SQL Setup

-- 1. Create PostgreSQL Database
CREATE DATABASE "Unintentional_injuries_NHS"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- 2. Create Tables and Import Data

-- 2.1 Create modified_admissions table
CREATE TABLE modified_admissions (
    FinancialYear VARCHAR,
    CA VARCHAR,
    AgeGroup VARCHAR,
    Sex VARCHAR,
    InjuryLocation VARCHAR,
    InjuryType VARCHAR,
    NumberOfAdmissions INTEGER
);

-- 2.2 Import data into modified_admissions
COPY modified_admissions FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_admissions.csv'
DELIMITER ',' CSV HEADER;

-- 2.3 Create modified_council_health_board table
CREATE TABLE modified_council_health_board (
    CA VARCHAR,
    CAName VARCHAR,
    HBName VARCHAR,
    Country VARCHAR
);

-- 2.4 Import data into modified_council_health_board
COPY modified_council_health_board FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_council_health_board.csv'
DELIMITER ',' CSV HEADER;

-- 3. Create Merged Data and Export as CSV

-- 3.1 Create a new table from the result of the join
SELECT *
INTO merged_data
FROM modified_admissions
JOIN modified_council_health_board ON modified_admissions.CA = modified_council_health_board.CA;

-- 3.2 Select data from merged_data
SELECT modified_admissions.FinancialYear, modified_admissions.CA, modified_admissions.AgeGroup, modified_admissions.Sex, modified_admissions.InjuryLocation, modified_admissions.InjuryType, modified_admissions.NumberOfAdmissions,
       modified_council_health_board.CAName, modified_council_health_board.HBName, modified_council_health_board.Country
INTO merged_data
FROM modified_admissions
JOIN modified_council_health_board ON modified_admissions.CA = modified_council_health_board.CA;

-- 3.3 Export merged_data as CSV
COPY merged_data TO 'C:/Program Files/PostgreSQL/16/data/Data_copy/merged_data.csv' DELIMITER ',' CSV HEADER;



## Data Analysis with Python

The project uses Jupyter Notebook (`unintentional_injuries_updated.ipynb`) for data analysis and visualization. The notebook addresses specific questions related to unintentional injuries.

## Jupyter Notebook

- `unintentional_injuries.ipynb`: Jupyter Notebook answering questions related to unintentional injuries using Pandas, Matplotlib, and Seaborn.

## Results and Insights

Findings and insights from each question are detailed in the Jupyter Notebook and can be reviewed in the `/docs` directory.

Question 1: Number of admissions in 2022/23

Finding: The total number of admissions for unintentional injuries in the year 2022/23 is 1084296.

Question 2: What percentage of these admissions were for falls?

Finding: The percentage of admissions for falls among all unintentional injuries in 2022/23 is 32.9%.

Question 3: Which health board had the largest percentage change in unintentional injuries admissions between 2020/21 and 2021/22?

Finding: The health board with the largest percentage change in unintentional injuries admissions from 2020/21 to 2021/22 is NHS Forth Valley.

Question 4a: Which health board had the highest number of admissions for road traffic accidents (RTA) in 2019/20?

Finding: The health board with the highest number of admissions for road traffic accidents in 2019/20 is NHS Greater Glasgow and Clyde.

Question 4b: What percentage of these admissions were for males?

Finding: The percentage of admissions for road traffic accidents that were for males in 2019/20 is 33.3%.

Question 5: What was the percentage change in admissions for scalds in the home in NHS Lothian Health Board from 2019/20 to 2020/21?

Finding: The percentage change in admissions for scalds in the home in NHS Lothian Health Board from 2019/20 to 2020/21 is 23.1%.

Question 6: In Perth and Kinross Council area in 2022/23, what percentage of admissions for falls occurred in the home?

Finding: The percentage of admissions for falls in the home within Perth and Kinross Council area in 2022/23 is 26.0%.

Question 7: In Scotland in 2022/23, how many admissions for unintentional injuries were there for females aged 75+?

Finding: The total number of admissions for unintentional injuries among females aged 75 and older in Scotland for 2022/23 is 68778.

Question 8: Plot the number of admissions for unintentional injuries for males in 2022/23 by location type and health board

The visualization of male unintentional injuries admissions in 2022/23 reveals notable regional variations. NHS Greater Glasgow and Clyde exhibit the highest cumulative admissions at 35,530, while NHS Shetland reports the lowest at 5,142. These discrepancies suggest potential differences in population density, urbanization, and public health priorities. Such insights can guide targeted interventions, resource allocation, and injury prevention strategies tailored to the specific needs of each health board.

## GitHub Repository Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/your_username/Scottish_Unintentional_Injuries.git
    cd Scottish_Unintentional_Injuries
    ```

2. Run the Jupyter Notebook locally using `unintentional_injuries.ipynb`.

## Requirements

- PostgreSQL 16
- Jupyter Notebook
- Python 3.x
- Required Python libraries (specified in `requirements.txt`)

## Future Improvements

Explore additional enhancements or analyses that could be performed for a more comprehensive understanding of unintentional injuries in Scotland.

## Acknowledgments

- NHS Statistics for providing the dataset.
- Matplotlib, Seaborn, PostgreSQL, and Jupyter for facilitating the analysis.

