defmodule PhoenixCsv.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do
      add :ip_address, :string, null: false
      add :country_code, :string
      add :country_name, :string
      add :city, :string
      add :visit_count, :integer, default: 1, null: false
      add :last_visited_at, :utc_datetime, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:visitors, [:ip_address])
  end
end
