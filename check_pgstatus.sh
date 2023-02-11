#!/bin/bash

# Set PostgreSQL connection information
PGUSER=postgres
PGHOST=localhost
PGPORT=5432
PGDATABASE=mydatabase

# Set email parameters
EMAIL_TO="you@example.com"
EMAIL_SUBJECT="PostgreSQL status update"
EMAIL_FROM="postgres@localhost"
SMTP_SERVER="smtp.example.com"
SMTP_PORT="587"
SMTP_USER="username"
SMTP_PASS="password"

# Define function to send email
send_email() {
    local body=$1
    echo -e "To: $EMAIL_TO\nSubject: $EMAIL_SUBJECT\nFrom: $EMAIL_FROM\n\n$body" | \
    ssmtp -C /etc/ssmtp/ssmtp.conf -ap $SMTP_PORT -au $SMTP_USER -ap $SMTP_PASS $SMTP_SERVER
}

# Define function to check PostgreSQL status
check_postgres() {
    # Get PostgreSQL status
    PGSTATUS=$(psql -h $PGHOST -p $PGPORT -U $PGUSER -c "SELECT 1" $PGDATABASE 2>&1)
    if [[ $PGSTATUS == *"could not connect to server"* || $PGSTATUS == *"No route to host"* || $PGSTATUS == *"Is the server running on host"* ]]; then
        send_email "PostgreSQL is down. Error message: $PGSTATUS"
    else
        send_email "PostgreSQL is up and running."
    fi
}

# Call check_postgres function
check_postgres
