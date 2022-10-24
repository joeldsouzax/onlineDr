defmodule OnlineDr.Account.Kind do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

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

  def alphabetical(query) do
    from k in query, order_by: k.name
  end
end
