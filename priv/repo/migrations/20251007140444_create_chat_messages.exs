defmodule PhoenixCsv.Repo.Migrations.CreateChatMessages do
  use Ecto.Migration

  def change do
    create table(:chat_messages) do
      add :username, :string, null: false
      add :content, :text, null: false

      timestamps(type: :utc_datetime, updated_at: false)
    end

    create index(:chat_messages, [:inserted_at])
  end
end
