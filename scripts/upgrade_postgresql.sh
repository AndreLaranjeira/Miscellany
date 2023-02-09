#!/bin/bash
# Description: Script to upgrade major versions of PostgreSQL using pg_upgrade.

# IMPORTANT: The commands presented are configured for Manjaro Linux.
# If you are on other variants of Linux, you might need to change them!

# Variables.
current_postgresql_major_version=$(
  psql --version | cut -d ' ' -f 3 | cut -d '.' -f 1
)
postgres_home_path=/var/lib/postgres
postgresql_configuration='--locale=en_US.UTF-8 --encoding=UTF8'

# Stop PostgreSQL service.
sudo systemctl stop postgresql.service

# Create necessary directories.
sudo mv $postgres_home_path/data $postgres_home_path/olddata
sudo mkdir $postgres_home_path/data $postgres_home_path/tmp
sudo chown postgres:postgres $postgres_home_path/data $postgres_home_path/tmp

# Run upgrade as postgres.
sudo -i -u postgres
cd $postgres_home_path/tmp
initdb -D $postgres_home_path/data $postgresql_configuration
pg_upgrade -b /opt/pgsql-$current_postgresql_major_version/bin \
  -B /usr/bin -d $postgres_home_path/olddata -D $postgres_home_path/data
logout

# Start PostgreSQL service again.
sudo systemctl start postgresql.service

# Clean up.
sudo rm -rfi $postgres_home_path/olddata $postgres_home_path/tmp

exit 0
