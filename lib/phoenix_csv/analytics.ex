defmodule PhoenixCsv.Analytics do
  @moduledoc """
  The Analytics context for tracking visitor data.
  """

  import Ecto.Query, warn: false
  alias PhoenixCsv.Repo
  alias PhoenixCsv.Analytics.Visitor

  @doc """
  Tracks a visitor by IP address. If the visitor already exists, increments their visit count.
  Otherwise, creates a new visitor record.
  """
  def track_visitor(ip_address, geo_data \\ %{}) do
    now = DateTime.utc_now()

    case Repo.get_by(Visitor, ip_address: ip_address) do
      nil ->
        %Visitor{}
        |> Visitor.changeset(%{
          ip_address: ip_address,
          country_code: geo_data[:country_code],
          country_name: geo_data[:country_name],
          city: geo_data[:city],
          visit_count: 1,
          last_visited_at: now
        })
        |> Repo.insert()

      visitor ->
        visitor
        |> Visitor.changeset(%{
          visit_count: visitor.visit_count + 1,
          last_visited_at: now
        })
        |> Repo.update()
    end
  end

  @doc """
  Returns the total number of unique visitors.
  """
  def get_total_visitors do
    Repo.aggregate(Visitor, :count, :id)
  end

  @doc """
  Returns the total number of visits across all visitors.
  """
  def get_total_visits do
    Repo.aggregate(Visitor, :sum, :visit_count) || 0
  end

  @doc """
  Returns visitor statistics grouped by country.
  Returns a list of maps with country_code, country_name, and visitor_count.
  """
  def get_visitors_by_country do
    Visitor
    |> where([v], not is_nil(v.country_code))
    |> group_by([v], [v.country_code, v.country_name])
    |> select([v], %{
      country_code: v.country_code,
      country_name: v.country_name,
      visitor_count: count(v.id),
      total_visits: sum(v.visit_count)
    })
    |> order_by([v], desc: sum(v.visit_count))
    |> Repo.all()
  end

  @doc """
  Returns recent visitors (last 100).
  """
  def get_recent_visitors(limit \\ 100) do
    Visitor
    |> order_by([v], desc: v.last_visited_at)
    |> limit(^limit)
    |> Repo.all()
  end
end
