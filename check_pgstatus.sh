#!/bin/bash

# Set PostgreSQL connection information
PGUSER=postgres
PGHOST=localhost
PGPORT=5432
PGDATABASE=postgres

# Define function to check PostgreSQL status
check_postgres() {
    # Get PostgreSQL status
    PGSTATUS=$(psql -h $PGHOST -p $PGPORT -U $PGUSER -c "SELECT 1" $PGDATABASE 2>&1)
    if [[ $PGSTATUS == *"could not connect to server"* || $PGSTATUS == *"No route to host"* || $PGSTATUS == *"Is the server running on host"* ]]; then
        echo "PostgreSQL is down. Error message: $PGSTATUS"
    else
        echo "PostgreSQL is up and running."
    fi
}

# Call check_postgres function
check_postgres
