import Config

# Configure database for test (SQLite)
config :phoenix_csv, PhoenixCsv.Repo,
  database: Path.expand("../phoenix_csv_test.db", __DIR__),
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :phoenix_csv, :ecto_adapter, Ecto.Adapters.SQLite3

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_csv, PhoenixCsvWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3TLd6I6E4zGEBFA/fLvn4C02/H8gG1lTflKzjt2o8XyRtHpUq7bG2/uUEJKYV+Jo",
  server: false

# In test we don't send emails
config :phoenix_csv, PhoenixCsv.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
