defmodule OnlineDr.Center do
  @moduledoc """
  The Center context.
  """

  import Ecto.Query, warn: false
  alias OnlineDr.Repo

  alias OnlineDr.Center.Clinic

  @doc """
  Returns the list of clinics.

  ## Examples

      iex> list_clinics()
      [%Clinic{}, ...]

  """
  def list_clinics do
    Repo.all(Clinic)
  end

  @doc """
  Gets a single clinic.

  Raises `Ecto.NoResultsError` if the Clinic does not exist.

  ## Examples

      iex> get_clinic!(123)
      %Clinic{}

      iex> get_clinic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clinic!(id), do: Repo.get!(Clinic, id)

  @doc """
  Creates a clinic.

  ## Examples

      iex> create_clinic(%{field: value})
      {:ok, %Clinic{}}

      iex> create_clinic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clinic(attrs \\ %{}) do
    %Clinic{}
    |> Clinic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clinic.

  ## Examples

      iex> update_clinic(clinic, %{field: new_value})
      {:ok, %Clinic{}}

      iex> update_clinic(clinic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clinic(%Clinic{} = clinic, attrs) do
    clinic
    |> Clinic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clinic.

  ## Examples

      iex> delete_clinic(clinic)
      {:ok, %Clinic{}}

      iex> delete_clinic(clinic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clinic(%Clinic{} = clinic) do
    Repo.delete(clinic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clinic changes.

  ## Examples

      iex> change_clinic(clinic)
      %Ecto.Changeset{data: %Clinic{}}

  """
  def change_clinic(%Clinic{} = clinic, attrs \\ %{}) do
    Clinic.changeset(clinic, attrs)
  end
end
