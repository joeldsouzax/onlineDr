#!/bin/bash

set -e

# insure dependencies are installed
mix deps.get

# wait for postgres to be available
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
    echo "$(date) - waiting for database to start"
    sleep 2
done

echo "\nPostgres is available: continuing with database setup"

if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
    echo "Database $PGDATABASE does not exist. Creating..."
    createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
   
    echo "$PGDATABASE created..."
fi

mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs

echo "\n Launching Phoenix web server"
mix phx.server