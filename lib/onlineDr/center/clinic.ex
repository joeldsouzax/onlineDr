defmodule OnlineDr.Center.Clinic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clinics" do
    field :address, :string
    field :name, :string
    field :phone_number, :string
    belongs_to :type, OnlineDr.Center.Type
    many_to_many :practioners, OnlineDr.Account.Practitioner, join_through: OnlineDr.ClinicsPractitioners
    timestamps()
  end

  @doc false
  def changeset(clinic, attrs) do
    clinic
    |> cast(attrs, [:name, :address, :phone_number, :type_id])
    |> validate_required([:name, :address, :phone_number])
    |> validate_length(:phone_number, min: 5)
    |> validate_format(:phone_number, ~r/^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/)
    |> assoc_constraint(:type)
  end
end
