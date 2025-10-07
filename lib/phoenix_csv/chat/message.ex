defmodule PhoenixCsv.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chat_messages" do
    field :username, :string
    field :content, :string

    timestamps(type: :utc_datetime, updated_at: false)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:username, :content])
    |> validate_required([:username, :content])
    |> validate_length(:content, min: 1, max: 500)
  end
end
