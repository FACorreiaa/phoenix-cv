defmodule PhoenixCsv.Repo.Migrations.CreateTestimonials do
  use Ecto.Migration

  def change do
    create table(:testimonials) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :role, :string
      add :company, :string
      add :relationship, :string
      add :content, :text, null: false
      add :linkedin_url, :string
      add :status, :string, default: "pending", null: false
      add :submitted_at, :utc_datetime, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:testimonials, [:status])
    create index(:testimonials, [:submitted_at])
  end
end
