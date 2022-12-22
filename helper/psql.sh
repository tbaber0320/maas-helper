#!/bin/bash

# Set the user and password variables
USERNAME=maas
PASSWORD=maas

# Set the database name
DATABASE=maas

# Connect to the default PostgreSQL database
sudo psql -U postgres <<EOF

# Create the new user
CREATE USER $USERNAME WITH ENCRYPTED PASSWORD '$PASSWORD';

# Create the new database
CREATE DATABASE $DATABASE WITH OWNER $USERNAME;

# Grant all privileges on the database to the user
GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $USERNAME;

EOF
