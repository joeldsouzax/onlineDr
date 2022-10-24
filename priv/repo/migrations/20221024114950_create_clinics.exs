defmodule OnlineDr.Repo.Migrations.CreateClinics do
  use Ecto.Migration

  def change do
    create table(:clinics) do
      add :name, :string
      add :address, :text
      add :phone_number, :string

      timestamps()
    end
  end
end
