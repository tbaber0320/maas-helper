#!/bin/bash

# Invoke & run bootstrap.sh
# Updates packages, installs postgres, snapd, maas, docker
echo  🧰 - bootstrapping platform services...
./helper/bootstrap.sh
echo  ✅ - Success - proceeding with postgres setup...
# Invoke & run psql.sh
# Create postgres database, user and assign role to user
./helper/psql.sh