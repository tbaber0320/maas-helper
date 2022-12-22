#!/bin/bash

# Set the user and password variables
USERNAME=maas
PASSWORD=maas

# Set the database name
DATABASE=maas

# Connect to the default PostgreSQL database
sudo -u postgres psql <<EOF

CREATE USER $USERNAME WITH ENCRYPTED PASSWORD '$PASSWORD';

CREATE DATABASE $DATABASE WITH OWNER $USERNAME;

GRANT ALL PRIVILEGES ON DATABASE $DATABASE TO $USERNAME;

EOF