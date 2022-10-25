defmodule OnlineDr.Repo.Migrations.CreateClinicsPractitioners do
  use Ecto.Migration

  def change do
    create table(:clinics_practitioners) do
      add :clinic_id, references(:clinics)
      add :practitioner_id, references(:practitioners)
    end

    create unique_index(:clinics_practitioners, [:clinic_id, :practitioner_id])
  end
end
