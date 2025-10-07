# Deployment Guide - Fly.io with PostgreSQL

## Prerequisites

- Fly.io account (sign up at https://fly.io)
- Fly.io CLI installed
- Git repository initialized

## Step-by-Step Deployment

### 1. Install Fly.io CLI

```bash
# macOS
brew install flyctl

# Or using install script
curl -L https://fly.io/install.sh | sh
```

### 2. Login to Fly.io

```bash
flyctl auth login
```

### 3. Create PostgreSQL Database

```bash
# Create a new Postgres cluster (free tier: 1GB storage)
flyctl postgres create --name phoenix-csv-db --region cdg

# Save the connection details shown in the output!
```

### 4. Attach Database to Your App

```bash
# This automatically sets DATABASE_URL secret
flyctl postgres attach phoenix-csv-db --app phoenix-csv
```

You should see output like:
```
Postgres cluster phoenix-csv-db is now attached to phoenix-csv
```

### 5. Set Application Secrets

```bash
# Generate a secret key base
mix phx.gen.secret

# Copy the output and set it as a secret (replace <output> with actual value)
flyctl secrets set SECRET_KEY_BASE=<output> --app phoenix-csv
```

### 6. Verify Secrets are Set

```bash
flyctl secrets list --app phoenix-csv
```

You should see:
- `DATABASE_URL` (set by postgres attach)
- `SECRET_KEY_BASE` (set manually)

### 7. Deploy Your Application

```bash
# Using the Makefile
make deploy

# Or directly with flyctl
flyctl deploy
```

The deployment will:
1. Build the Docker image
2. Push it to Fly.io
3. Run the release command (`/app/bin/migrate`) to run migrations
4. Start the application

### 8. Verify Deployment

```bash
# Check app status
flyctl status --app phoenix-csv

# View logs
flyctl logs --app phoenix-csv

# Open in browser
flyctl open --app phoenix-csv
```

### 9. Run Migrations (if needed manually)

```bash
# SSH into the app and run migrations
flyctl ssh console --app phoenix-csv -C "/app/bin/migrate"
```

## Subsequent Deployments

After the initial setup, you can deploy with just:

```bash
# Commit and deploy in one command
make push-deploy

# Or just deploy (if already committed)
make deploy
```

## Database Management

### Connect to PostgreSQL

```bash
# Connect to Postgres via proxy
flyctl proxy 5432 --app phoenix-csv-db

# In another terminal, connect with psql
psql postgres://postgres:<password>@localhost:5432/phoenix_csv
```

### View Database Logs

```bash
flyctl logs --app phoenix-csv-db
```

### Database Backup

```bash
# Fly.io automatically backs up Postgres daily
# List backups
flyctl postgres backups list --app phoenix-csv-db
```

## Scaling

### Scale Machines

```bash
# Scale up
flyctl scale count 2 --app phoenix-csv

# Scale down
flyctl scale count 1 --app phoenix-csv
```

### Scale Database

```bash
# Upgrade Postgres (paid plans)
flyctl postgres update --app phoenix-csv-db
```

## Environment Variables

### View Current Config

```bash
flyctl config show --app phoenix-csv
```

### Set Additional Secrets

```bash
flyctl secrets set KEY=value --app phoenix-csv
```

## Troubleshooting

### Check Application Health

```bash
flyctl checks list --app phoenix-csv
```

### View Detailed Logs

```bash
# Real-time logs
flyctl logs --app phoenix-csv

# Filter by level
flyctl logs --app phoenix-csv | grep ERROR
```

### SSH into Running Instance

```bash
flyctl ssh console --app phoenix-csv
```

### Restart Application

```bash
flyctl apps restart phoenix-csv
```

### Database Connection Issues

```bash
# Check if DATABASE_URL is set
flyctl secrets list --app phoenix-csv

# Verify Postgres is running
flyctl status --app phoenix-csv-db

# Check database logs
flyctl logs --app phoenix-csv-db
```

### Migration Failures

```bash
# Run migrations manually
flyctl ssh console --app phoenix-csv -C "/app/bin/migrate"

# Check migration status from IEx console
flyctl ssh console --app phoenix-csv
/app/bin/phoenix_csv remote
Ecto.Migrator.migrations(PhoenixCsv.Repo)
```

## GeoIP Database in Production

The GeoLite2 database file is copied during Docker build. To update it:

1. Download new version from MaxMind
2. Replace `priv/geolix/GeoLite2-Country.mmdb`
3. Redeploy: `make deploy`

## Cost Estimates (as of 2025)

- **App hosting**: Free tier available (shared CPU, 256MB RAM)
- **PostgreSQL**: Free tier: 1GB storage, shared CPU
- **Bandwidth**: 160GB free per month

For production at scale, consider upgrading to paid plans.

## Useful Commands Summary

```bash
# Deployment
make deploy                    # Deploy to Fly.io
make push-deploy              # Commit + deploy

# Monitoring
flyctl status                 # App status
flyctl logs                   # View logs
flyctl checks list            # Health checks

# Database
flyctl postgres attach        # Attach DB
flyctl ssh console -C migrate # Run migrations
flyctl postgres backups list  # List backups

# Debugging
flyctl ssh console            # SSH into app
flyctl config show            # Show config
flyctl secrets list           # List secrets
```

## Additional Resources

- [Fly.io Elixir Guide](https://fly.io/docs/elixir/)
- [Fly.io Postgres](https://fly.io/docs/postgres/)
- [Phoenix Deployment Guide](https://hexdocs.pm/phoenix/deployment.html)
