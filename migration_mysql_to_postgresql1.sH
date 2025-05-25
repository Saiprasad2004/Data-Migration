#!/bin/bash

# CONFIG
MYSQL_USER="root"
MYSQL_PASS="your_mysql_password"
MYSQL_DB="codtech"
PG_USER="postgres"
PG_DB="codtech_pg"
MYSQL_DUMP="mysql_dump.sql"
INSERTS_ONLY="inserts.sql"
SCHEMA_FILE="schema_conversion.sql"
FINAL_SQL="pg_final_migration.sql"

# 1. Dump MySQL
echo "[+] Dumping MySQL..."
mysqldump -u $MYSQL_USER -p$MYSQL_PASS $MYSQL_DB > $MYSQL_DUMP

# 2. Extract Inserts
echo "[+] Extracting INSERT statements..."
grep -E "^INSERT INTO" $MYSQL_DUMP > $INSERTS_ONLY

# 3. Combine Schema + Inserts
echo "[+] Combining schema and inserts..."
cat $SCHEMA_FILE $INSERTS_ONLY > $FINAL_SQL

# 4. Create PostgreSQL DB
echo "[+] Creating PostgreSQL DB '$PG_DB'..."
createdb -U $PG_USER $PG_DB

# 5. Import into PostgreSQL
echo "[+] Importing data into PostgreSQL..."
psql -U $PG_USER -d $PG_DB -f $FINAL_SQL

# 6. Verify
echo "[+] Verifying row count:"
psql -U $PG_USER -d $PG_DB -c "SELECT COUNT(*) FROM employees;"
