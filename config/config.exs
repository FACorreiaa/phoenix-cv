# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :phoenix_csv,
  ecto_repos: [PhoenixCsv.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :phoenix_csv, PhoenixCsvWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: PhoenixCsvWeb.ErrorHTML, json: PhoenixCsvWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PhoenixCsv.PubSub,
  live_view: [signing_salt: "sUVlvhXK"]

# Email sending is done via Resend API directly in production
# No Swoosh mailer needed for this simple use case

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.25.4",
  phoenix_csv: [
    args:
      ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/* --alias:@=.),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => [Path.expand("../deps", __DIR__), Mix.Project.build_path()]}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "4.1.7",
  phoenix_csv: [
    args: ~w(
      --input=assets/css/app.css
      --output=priv/static/assets/css/app.css
    ),
    cd: Path.expand("..", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configure Geolix for IP geolocation
# To use this feature, download the free GeoLite2 Country database from MaxMind:
# https://dev.maxmind.com/geoip/geolite2-free-geolocation-data
# Place the .mmdb file in priv/geolix/GeoLite2-Country.mmdb
config :geolix,
  databases: [
    %{
      id: :country,
      adapter: Geolix.Adapter.MMDB2,
      source: Path.expand("../priv/geolix/GeoLite2-Country.mmdb", __DIR__)
    }
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
