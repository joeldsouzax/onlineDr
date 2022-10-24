defmodule OnlineDrWeb.ClinicController do
  use OnlineDrWeb, :controller

  plug :load_types when action in [:new, :create, :edit, :update]

  alias OnlineDr.Center
  alias OnlineDr.Center.Clinic

  def index(conn, _params) do
    clinics = Center.list_clinics()
    render(conn, "index.html", clinics: clinics)
  end

  def new(conn, _params) do
    changeset = Center.change_clinic(%Clinic{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"clinic" => clinic_params}) do
    case Center.create_clinic(clinic_params) do
      {:ok, clinic} ->
        conn
        |> put_flash(:info, "Clinic created successfully.")
        |> redirect(to: Routes.clinic_path(conn, :show, clinic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clinic = Center.get_clinic!(id)
    render(conn, "show.html", clinic: clinic)
  end

  def edit(conn, %{"id" => id}) do
    clinic = Center.get_clinic!(id)
    changeset = Center.change_clinic(clinic)
    render(conn, "edit.html", clinic: clinic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "clinic" => clinic_params}) do
    clinic = Center.get_clinic!(id)

    case Center.update_clinic(clinic, clinic_params) do
      {:ok, clinic} ->
        conn
        |> put_flash(:info, "Clinic updated successfully.")
        |> redirect(to: Routes.clinic_path(conn, :show, clinic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", clinic: clinic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clinic = Center.get_clinic!(id)
    {:ok, _clinic} = Center.delete_clinic(clinic)

    conn
    |> put_flash(:info, "Clinic deleted successfully.")
    |> redirect(to: Routes.clinic_path(conn, :index))
  end

  defp load_types(conn, _) do
    assign(conn, :types, Center.list_alphabetical_types())
  end
end
