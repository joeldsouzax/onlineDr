defmodule OnlineDr.Center.Clinic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clinics" do
    field :address, :string
    field :name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(clinic, attrs) do
    clinic
    |> cast(attrs, [:name, :address, :phone_number])
    |> validate_required([:name, :address, :phone_number])
    |> validate_length(:phone_number, min: 5)
    |> validate_format(:phone_number, ~r/^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/)
  end
end
