#!/bin/bash

# Set PostgreSQL connection information
PGUSER=yourusername
PGPASSWORD=yourpassword
PGHOST=localhost
PGPORT=5432
PGDATABASE=yourdatabase

# Connect to PostgreSQL and query pg_stat_activity and pg_stat_user_tables
psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -c "SELECT * FROM pg_stat_activity;"
psql -h $PGHOST -p $PGPORT -U $PGUSER -d $PGDATABASE -c "SELECT * FROM pg_stat_user_tables;"
