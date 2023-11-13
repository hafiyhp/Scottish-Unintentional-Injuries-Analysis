# Scottish Unintentional Injuries Analysis

## Overview

This project aims to analyze unintentional injuries data in Scotland using a combination of SQL and Python. The dataset, sourced from NHS statistics, provides valuable insights into admissions, causes, and trends related to unintentional injuries.

## Data Source

The dataset used in this project is available from [Scottish Health and Social Care Open Data for unintentional injuries admissions]([[link 1](https://www.opendata.nhs.scot/dataset/unintentional-injuries/resource/aee43295-2a13-48f6-bf05-92769ca7c6cf)] and [for Council Area 2011 - Council Area 2019]([[link 2](https://www.opendata.nhs.scot/dataset/geography-codes-and-labels)].

## Project Structure

The project is organized into the following directories:

- `/data`: Contains the raw and modified CSV files.
- `/scripts`: Includes SQL scripts for database creation.
- `/visualizations`: Stores the generated plots and visualizations.
- `/docs`: Contains documentation files.

## SQL Setup

1. **Create PostgreSQL Database:**
    ```sql
    CREATE DATABASE "Unintentional_injuries_NHS"
        WITH
        OWNER = postgres
        ENCODING = 'UTF8'
        LC_COLLATE = 'English_United States.1252'
        LC_CTYPE = 'English_United States.1252'
        TABLESPACE = pg_default
        CONNECTION LIMIT = -1
        IS_TEMPLATE = False;
    ```

2. **Create Tables and Import Data:**
    ```sql
    -- Create modified_admissions table
    CREATE TABLE modified_admissions (
        FinancialYear VARCHAR,
        CA VARCHAR,
        AgeGroup VARCHAR,
        Sex VARCHAR,
        InjuryLocation VARCHAR,
        InjuryType VARCHAR,
        NumberOfAdmissions INTEGER
    );

    -- Import data into modified_admissions
    COPY modified_admissions FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_admissions.csv'
    DELIMITER ',' CSV HEADER;

    -- Create modified_council_health_board table
    CREATE TABLE modified_council_health_board (
        CA VARCHAR,
        CAName VARCHAR,
        HBName VARCHAR,
        Country VARCHAR
    );

    -- Import data into modified_council_health_board
    COPY modified_council_health_board FROM 'C:/Program Files/PostgreSQL/16/data/Data_copy/modified_council_health_board.csv'
    DELIMITER ',' CSV HEADER;
    ```

## Data Analysis with Python

The project uses Jupyter Notebook (`unintentional_injuries.ipynb`) for data analysis and visualization. The notebook addresses specific questions related to unintentional injuries.

## Jupyter Notebook

- `unintentional_injuries.ipynb`: Jupyter Notebook answering questions related to unintentional injuries using Pandas, Matplotlib, and Seaborn.

## Results and Insights

Findings and insights from each question are detailed in the Jupyter Notebook and can be reviewed in the `/docs` directory.

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

