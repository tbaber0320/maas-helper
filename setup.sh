#!/bin/bash

# Invoke & run bootstrap.sh
# Updates packages, installs postgres, snapd, maas, docker
echo  🧰 - Installing platform services...
./helper/bootstrap.sh
echo  ✅ - Success - proceeding with postgres setup...
# Invoke & run psql.sh
# Create postgres database, user and assign role to user
./helper/psql.sh
echo  ✅ - Success - invoking MaaS regiond + rackd setup
sudo maas init region+rack --database-uri "postgres://maas:maas@localhost/maas"
sudo maas createadmin

echo ✅ - Setup completed! Please login to MaaS to continue configuration.