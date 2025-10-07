# Phoenix CSV - Setup Guide

## Prerequisites

- Elixir 1.15+
- PostgreSQL (for production on Fly.io)
- Fly.io CLI (for deployment)

## Local Development Setup

1. **Install dependencies:**
   ```bash
   mix deps.get
   ```

2. **Setup database:**
   ```bash
   mix ecto.setup
   ```

3. **Download GeoLite2 Database (Optional but recommended for IP geolocation):**
   - Sign up for a free account at https://www.maxmind.com/en/geolite2/signup
   - Download the GeoLite2 Country database (MMDB format)
   - Place it at `priv/geolix/GeoLite2-Country.mmdb`

   Without this file, the visitor analytics will still work but won't show country information.

4. **Install assets:**
   ```bash
   mix assets.setup
   ```

5. **Start the server:**
   ```bash
   mix phx.server
   ```

   Visit http://localhost:4000

## Production Deployment to Fly.io

### First-Time Setup

1. **Create Fly.io Postgres database:**
   ```bash
   flyctl postgres create --name phoenix-csv-db --region cdg
   ```

2. **Attach database to your app:**
   ```bash
   flyctl postgres attach phoenix-csv-db
   ```

   This will automatically set the `DATABASE_URL` secret for your app.

3. **Set required secrets:**
   ```bash
   # Generate a secret key base
   mix phx.gen.secret

   # Set it as a secret
   flyctl secrets set SECRET_KEY_BASE=<your-generated-secret>
   ```

4. **Deploy:**
   ```bash
   flyctl deploy
   ```

   Or use the Makefile:
   ```bash
   make deploy
   ```

### Subsequent Deployments

Simply use:
```bash
make deploy
```

Or to commit changes and deploy in one step:
```bash
make push-deploy
```

### Running Migrations on Fly.io

After deploying, run migrations:
```bash
flyctl ssh console -C "/app/bin/migrate"
```

Or connect to your app and run manually:
```bash
flyctl ssh console
/app/bin/phoenix_csv eval "PhoenixCsv.Release.migrate"
```

## Database Configuration

### Development
- Uses SQLite (`phoenix_csv_dev.db`)
- Automatically created with `mix ecto.setup`

### Test
- Uses SQLite (`phoenix_csv_test.db`)
- Automatically managed by test suite

### Production
- Uses PostgreSQL on Fly.io
- Configured via `DATABASE_URL` environment variable
- Automatically attached when you run `flyctl postgres attach`

## Visitor Analytics Feature

The app tracks visitor analytics including:
- Unique visitors count
- Total page views
- Visitor countries (requires GeoLite2 database)

### How it works:
1. When users visit the About page, their IP is captured
2. IP is looked up in the GeoLite2 database for country information
3. Visitor record is created or updated in the database
4. Analytics are displayed on the About page

### Privacy Note:
- IP addresses are stored for analytics purposes
- Only country-level geolocation is tracked (not city/precise location)
- Consider adding a privacy policy page if deploying publicly

## Available Make Commands

- `make push` - Commit and push changes to git
- `make deploy` - Deploy to Fly.io
- `make push-deploy` - Commit, push, and deploy in one step

## Troubleshooting

### GeoIP Database Not Found
If you see warnings about the GeoLite2 database:
1. Download it from MaxMind (see step 3 in Local Development Setup)
2. Place it in the correct directory: `priv/geolix/GeoLite2-Country.mmdb`
3. Restart your server

### Database Locked (SQLite)
If you see "database is locked" errors:
1. Make sure only one Phoenix server instance is running
2. Stop all background processes with `pkill -f "mix phx.server"`
3. Delete the `.db-shm` and `.db-wal` files if they exist
4. Restart the server

### Migration Issues on Fly.io
If migrations fail on Fly.io:
1. Check database connection: `flyctl ssh console -C "printenv DATABASE_URL"`
2. Ensure database is attached: `flyctl postgres list`
3. Check database logs: `flyctl logs --app phoenix-csv-db`

## Learn More

- Phoenix Framework: https://www.phoenixframework.org/
- Fly.io Deployment: https://fly.io/docs/elixir/
- Geolix: https://hexdocs.pm/geolix/
- DaisyUI: https://daisyui.com/
