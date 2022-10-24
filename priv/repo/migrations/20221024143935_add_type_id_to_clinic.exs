defmodule OnlineDr.Repo.Migrations.AddTypeIdToClinic do
  use Ecto.Migration

  def change do
    alter table(:clinics) do
      add :type_id, references(:types)
    end
  end
end
