defmodule OnlineDr.Repo.Migrations.AddKindIdToPractitioner do
  use Ecto.Migration

  def change do
    alter table(:practitioners) do
      add :kind_id, references(:kinds)
    end
  end
end
