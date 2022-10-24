defmodule OnlineDr.Center.Type do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end


  def alphabetical(query) do
    from t in query, order_by: t.name
  end
end
