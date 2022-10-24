defmodule OnlineDrWeb.PractitionerController do
  use OnlineDrWeb, :controller

  alias OnlineDr.Account
  alias OnlineDr.Account.Practitioner

  def index(conn, _params) do
    practitioners = Account.list_practitioners()
    render(conn, "index.html", practitioners: practitioners)
  end

  def new(conn, _params) do
    changeset = Account.change_practitioner(%Practitioner{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"practitioner" => practitioner_params}) do
    case Account.create_practitioner(practitioner_params) do
      {:ok, practitioner} ->
        conn
        |> put_flash(:info, "Practitioner created successfully.")
        |> redirect(to: Routes.practitioner_path(conn, :show, practitioner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    render(conn, "show.html", practitioner: practitioner)
  end

  def edit(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    changeset = Account.change_practitioner(practitioner)
    render(conn, "edit.html", practitioner: practitioner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "practitioner" => practitioner_params}) do
    practitioner = Account.get_practitioner!(id)

    case Account.update_practitioner(practitioner, practitioner_params) do
      {:ok, practitioner} ->
        conn
        |> put_flash(:info, "Practitioner updated successfully.")
        |> redirect(to: Routes.practitioner_path(conn, :show, practitioner))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", practitioner: practitioner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    {:ok, _practitioner} = Account.delete_practitioner(practitioner)

    conn
    |> put_flash(:info, "Practitioner deleted successfully.")
    |> redirect(to: Routes.practitioner_path(conn, :index))
  end
end
