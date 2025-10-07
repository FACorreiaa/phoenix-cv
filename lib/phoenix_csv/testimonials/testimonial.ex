defmodule PhoenixCsv.Testimonials.Testimonial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "testimonials" do
    field :name, :string
    field :email, :string
    field :role, :string
    field :company, :string
    field :relationship, :string
    field :content, :string
    field :linkedin_url, :string
    field :status, :string, default: "pending"
    field :submitted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(testimonial, attrs) do
    testimonial
    |> cast(attrs, [:name, :email, :role, :company, :relationship, :content, :linkedin_url, :status, :submitted_at])
    |> validate_required([:name, :email, :content])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email")
    |> validate_inclusion(:status, ["pending", "approved", "rejected"])
    |> validate_length(:content, min: 10, max: 1000)
    |> put_submitted_at()
  end

  defp put_submitted_at(changeset) do
    if get_field(changeset, :submitted_at) do
      changeset
    else
      put_change(changeset, :submitted_at, DateTime.utc_now())
    end
  end
end
