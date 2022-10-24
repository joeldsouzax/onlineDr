defmodule OnlineDr.Account.Practitioner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "practitioners" do
    field :description, :string
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(practitioner, attrs) do
    practitioner
    |> cast(attrs, [:name, :phone_number, :description])
    |> validate_required([:name, :phone_number, :description])
  end
end
