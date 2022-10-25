defmodule OnlineDr.Account.Practitioner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "practitioners" do
    field :description, :string
    field :name, :string
    field :phone_number, :string
    belongs_to :kind, OnlineDr.Account.Kind
    many_to_many :clinics, OnlineDr.Center.Clinic, join_through: "clinics-practitioners"
    timestamps()
  end

  ## TODO: generalize the validation regexes
  @doc false
  def changeset(practitioner, attrs) do
    practitioner
    |> cast(attrs, [:name, :phone_number, :description, :kind_id])
    |> validate_required([:name, :phone_number, :description])
    |> validate_length(:phone_number,min: 5)
    |> validate_format(:phone_number, ~r/^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$/)
    |> assoc_constraint(:kind)
  end
end
