defmodule OnlineDr.CenterFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnlineDr.Center` context.
  """

  @doc """
  Generate a clinic.
  """
  def clinic_fixture(attrs \\ %{}) do
    {:ok, clinic} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name",
        phone_number: "some phone_number"
      })
      |> OnlineDr.Center.create_clinic()

    clinic
  end
end
