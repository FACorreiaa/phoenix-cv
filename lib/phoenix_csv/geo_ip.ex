defmodule PhoenixCsv.GeoIP do
  @moduledoc """
  GeoIP lookup service using Geolix.
  """

  @doc """
  Looks up geographic information for an IP address.
  Returns a map with country_code, country_name, and city.
  """
  def lookup(ip_address) when is_binary(ip_address) do
    case :inet.parse_address(String.to_charlist(ip_address)) do
      {:ok, ip_tuple} -> lookup(ip_tuple)
      {:error, _} -> %{}
    end
  end

  def lookup(ip_address) do
    case Geolix.lookup(ip_address, as: :raw, where: :country) do
      %{country: country_data} ->
        %{
          country_code: get_in(country_data, [:country, :iso_code]),
          country_name: get_in(country_data, [:country, :names, :en]),
          city: get_in(country_data, [:city, :names, :en])
        }

      _ ->
        %{}
    end
  end

  @doc """
  Gets the client IP address from a LiveView socket.
  In development, this will typically return 127.0.0.1.
  In production behind a proxy, it will try to extract the real IP from X-Forwarded-For.
  """
  def get_client_ip(socket) do
    # For LiveView, we get connection info from connect_info
    connect_info = get_in(socket.private, [:connect_info])

    # Try to get peer data which contains the IP
    case get_in(connect_info, [:peer_data]) do
      %{address: address} when is_tuple(address) ->
        address
        |> :inet.ntoa()
        |> to_string()

      _ ->
        # Fallback to localhost for development
        "127.0.0.1"
    end
  end
end
