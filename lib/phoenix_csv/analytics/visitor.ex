defmodule PhoenixCsv.Analytics.Visitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitors" do
    field :ip_address, :string
    field :country_code, :string
    field :country_name, :string
    field :city, :string
    field :visit_count, :integer, default: 1
    field :last_visited_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:ip_address, :country_code, :country_name, :city, :visit_count, :last_visited_at])
    |> validate_required([:ip_address, :last_visited_at])
    |> unique_constraint(:ip_address)
  end
end
