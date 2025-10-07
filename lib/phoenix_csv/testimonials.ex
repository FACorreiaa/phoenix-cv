defmodule PhoenixCsv.Testimonials do
  @moduledoc """
  The Testimonials context for managing testimonials and recommendations.
  """

  import Ecto.Query, warn: false
  alias PhoenixCsv.Repo
  alias PhoenixCsv.Testimonials.Testimonial

  @doc """
  Returns the list of approved testimonials, ordered by most recent first.
  """
  def list_approved_testimonials do
    Testimonial
    |> where([t], t.status == "approved")
    |> order_by([t], desc: t.submitted_at)
    |> Repo.all()
  end

  @doc """
  Returns the list of pending testimonials for moderation.
  """
  def list_pending_testimonials do
    Testimonial
    |> where([t], t.status == "pending")
    |> order_by([t], desc: t.submitted_at)
    |> Repo.all()
  end

  @doc """
  Returns all testimonials (for admin view).
  """
  def list_all_testimonials do
    Testimonial
    |> order_by([t], desc: t.submitted_at)
    |> Repo.all()
  end

  @doc """
  Gets a single testimonial.
  """
  def get_testimonial!(id), do: Repo.get!(Testimonial, id)

  @doc """
  Creates a testimonial.
  """
  def create_testimonial(attrs \\ %{}) do
    %Testimonial{}
    |> Testimonial.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a testimonial.
  """
  def update_testimonial(%Testimonial{} = testimonial, attrs) do
    testimonial
    |> Testimonial.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Approves a testimonial.
  """
  def approve_testimonial(%Testimonial{} = testimonial) do
    update_testimonial(testimonial, %{status: "approved"})
  end

  @doc """
  Rejects a testimonial.
  """
  def reject_testimonial(%Testimonial{} = testimonial) do
    update_testimonial(testimonial, %{status: "rejected"})
  end

  @doc """
  Deletes a testimonial.
  """
  def delete_testimonial(%Testimonial{} = testimonial) do
    Repo.delete(testimonial)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking testimonial changes.
  """
  def change_testimonial(%Testimonial{} = testimonial, attrs \\ %{}) do
    Testimonial.changeset(testimonial, attrs)
  end

  @doc """
  Returns the count of pending testimonials (for notification badge).
  """
  def count_pending_testimonials do
    Testimonial
    |> where([t], t.status == "pending")
    |> Repo.aggregate(:count, :id)
  end
end
