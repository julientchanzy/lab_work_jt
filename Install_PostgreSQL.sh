#!/bin/bash

# Install PostgreSQL 13
sshpass -p "postgres" ssh -o StrictHostKeyChecking=no root@172.16.0.239 << EOF
sudo yum install -y https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql13-server postgresql13-contrib
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
sudo systemctl start postgresql-13.service
EOF
