defmodule OnlineDr.Repo.Migrations.CreateKinds do
  use Ecto.Migration

  def change do
    create table(:kinds) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:kinds, [:name])
  end
end
