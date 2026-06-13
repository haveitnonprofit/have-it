#!/bin/sh

# Kill any previous process running on APP_PORT
if [ -n "$APP_PORT" ]; then
    fuser -k "${APP_PORT}/tcp" 2>/dev/null && echo "Stopped previous process on port $APP_PORT"
fi

# PostgreSQL setup
export PGDATA=/var/lib/postgresql/data

# Create postgres user if not exists
if ! id -u postgres >/dev/null 2>&1; then
    adduser -D postgres
fi

# Initialize PostgreSQL if not initialized
if [ ! -f "$PGDATA/PG_VERSION" ]; then
    mkdir -p $PGDATA
    chown postgres:postgres $PGDATA
    su - postgres -c "initdb -D $PGDATA"
fi

# Configure pg_hba.conf for local connections only
echo "local all all trust" > $PGDATA/pg_hba.conf
echo "host all all 127.0.0.1/32 trust" >> $PGDATA/pg_hba.conf
echo "host all all ::1/128 trust" >> $PGDATA/pg_hba.conf

# Create log file and set permissions
mkdir -p /var/log/postgresql
touch /var/log/postgresql/postgresql.log
chmod 777 /var/log/postgresql/postgresql.log

# Create run directory for PostgreSQL socket
mkdir -p /run/postgresql
chown postgres:postgres /run/postgresql
chmod 777 /run/postgresql

# Start PostgreSQL
su - postgres -c "pg_ctl -D $PGDATA -l /var/log/postgresql/postgresql.log start -o '-p 5432'"

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to start..."
for i in $(seq 1 30); do
    if su - postgres -c "pg_isready" >/dev/null 2>&1; then
        echo "PostgreSQL is ready!"
        break
    fi
    # Show log if failed
    if [ $i -eq 30 ]; then
        echo "PostgreSQL failed to start. Last 20 lines of log:"
        tail -20 /var/log/postgresql/postgresql.log
    fi
    sleep 1
done

# Create database user if not exists
su - postgres -c "psql -tc \"SELECT 1 FROM pg_roles WHERE rolname = '$DB_USERNAME'\"" | grep -q 1 || \
    su - postgres -c "createuser $DB_USERNAME"

# Create database if not exists
su - postgres -c "psql -tc \"SELECT 1 FROM pg_database WHERE datname = '$DB_DATABASE'\"" | grep -q 1 || \
    su - postgres -c "createdb -O $DB_USERNAME $DB_DATABASE"

echo "=========================================="
echo "Database is ready!"
echo "=========================================="

# Install dependencies
echo "Installing dependencies..."
pnpm install --frozen-lockfile
echo "Dependencies installed."

# Configure git commit template
git config commit.template .gitmessage 2>/dev/null && echo "Git commit template configured." || true

# Keep container running
tail -f /dev/null