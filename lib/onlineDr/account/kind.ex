defmodule OnlineDr.Account.Kind do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kinds" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(kind, attrs) do
    kind
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
