defmodule PhoenixCsv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixCsvWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_csv, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixCsv.PubSub},
      # Start a worker by calling: PhoenixCsv.Worker.start_link(arg)
      # {PhoenixCsv.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixCsvWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixCsv.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixCsvWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
