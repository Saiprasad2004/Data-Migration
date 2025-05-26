# Data-Migration
Database-Migration-MySQL-to-PostgreSQL


"COMPANY": CODTECH IT SOLUTIONS


"NAME": pasupula sai prasad


"INTERN ID": CT04DL1156


"DOMAIN": SQL


"DURATION": 4 WEEKS


"MENTOR": NEELA SANTOSH

Task Description The objective of this task is to migrate data from a MySQL database (source_db) to a PostgreSQL database (target_db) while ensuring data integrity is preserved throughout the process. This is a common real-world requirement when transitioning systems or modernizing legacy infrastructure.

The deliverables include the migration scripts and a summary report outlining the entire migration process from start to finish.

📁 Steps & Included Files

migration_mysql_to_postgresql.sh This Bash script handles the automated migration process with the following steps:
Utilizes mysqldump to export the full schema and data from the MySQL database.

Separates and cleans up:

The schema structure (converted using schema_conversion.sql)

The data (INSERT statements extracted from the MySQL dump)

Creates the target PostgreSQL database, if it doesn't already exist.

Imports the PostgreSQL-compatible schema and data into the target database.

Verifies data migration by comparing row counts (e.g., for a sample table like employees) between the source and target databases.

schema_conversion.sql This file contains the PostgreSQL-compatible CREATE TABLE statements that replicate the original MySQL schema. Key conversions include:
Replacing MySQL's AUTO_INCREMENT with PostgreSQL's SERIAL.

Removing MySQL-specific syntax like backticks (`).

Adapting data types and constraints to match PostgreSQL standards.

Example: The MySQL table for employees is transformed to a clean PostgreSQL-compatible structure.

Report (Process Overview)

Step 1: Setting up MySQL and PostgreSQL Environments Both MySQL and PostgreSQL servers are configured and running locally or via containers.

![Image](https://github.com/user-attachments/assets/cd62c5d8-c039-431d-a1c7-4c69d47deff2)

Step 2: Creating & Exporting the MySQL Database A complete export of the source MySQL database is performed using mysqldump.

Image
Step 3: Extracting INSERT Queries The dump file is parsed to separate the INSERT statements for use in PostgreSQL.

Image
Step 4: Importing Tables into PostgreSQL The converted schema and extracted data are successfully imported into the PostgreSQL target database using psql.

Image
