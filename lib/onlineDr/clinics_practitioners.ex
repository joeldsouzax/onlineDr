defmodule OnlineDr.ClinicsPractitioners do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "clinics_practitioners" do
    belongs_to :clinic, OnlineDr.Center.Clinic
    belongs_to :practitioner, OnlineDr.Account.Practitioner
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:clinic_id, :practitioner_id])
    |> validate_required([:clinic_id, :practioner_id])
  end
end
