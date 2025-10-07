defmodule PhoenixCsv.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_csv,
    adapter: Application.compile_env!(:phoenix_csv, :ecto_adapter)
end
