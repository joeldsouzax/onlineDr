defmodule OnlineDr.Repo.Migrations.CreatePractitioners do
  use Ecto.Migration

  def change do
    create table(:practitioners) do
      add :name, :string
      add :phone_number, :string
      add :description, :text

      timestamps()
    end
  end
end
