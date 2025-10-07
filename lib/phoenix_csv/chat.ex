defmodule PhoenixCsv.Chat do
  @moduledoc """
  The Chat context for real-time messaging.
  """

  import Ecto.Query, warn: false
  alias PhoenixCsv.Repo
  alias PhoenixCsv.Chat.Message

  @doc """
  Returns the list of recent chat messages (last 50).
  """
  def list_recent_messages(limit \\ 50) do
    Message
    |> order_by([m], desc: m.inserted_at)
    |> limit(^limit)
    |> Repo.all()
    |> Enum.reverse()
  end

  @doc """
  Creates a chat message.
  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Generates a random anonymous username.
  """
  def generate_username do
    number = :rand.uniform(9999)
    "Anon#{number}"
  end
end
