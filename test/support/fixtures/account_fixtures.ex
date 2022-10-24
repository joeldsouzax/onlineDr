defmodule OnlineDr.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnlineDr.Account` context.
  """

  @doc """
  Generate a practitioner.
  """
  def practitioner_fixture(attrs \\ %{}) do
    {:ok, practitioner} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        phone_number: "some phone_number"
      })
      |> OnlineDr.Account.create_practitioner()

    practitioner
  end
end
