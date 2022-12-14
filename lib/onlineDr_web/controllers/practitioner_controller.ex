defmodule OnlineDrWeb.PractitionerController do
  use OnlineDrWeb, :controller
  plug :load_kinds when action in [:new, :create, :edit, :update]

  alias OnlineDr.Account
  alias OnlineDr.Account.Practitioner

  def index(conn, _params) do
    practitioners = Account.list_practitioners()
    render(conn, "index.html", practitioners: practitioners)
  end

  def new(conn, _params) do
    changeset = Account.change_practitioner(%Practitioner{})
    data = Account.load_clinics(changeset.data)
    clinics = OnlineDr.Center.list_clinics()
    render(conn, "new.html", changeset: %{changeset | data: data}, clinics: clinics)
  end

  def create(conn, %{"practitioner" => practitioner_params}) do
    case Account.create_practitioner(practitioner_params) do
      {:ok, practitioner} ->
        conn
        |> put_flash(:info, "Practitioner created successfully.")
        |> redirect(to: Routes.practitioner_path(conn, :show, practitioner))

      {:error, %Ecto.Changeset{} = changeset} ->
        data = Account.load_clinics(changeset.data)
        clinics = OnlineDr.Center.list_clinics()
        render(conn, "new.html", changeset: %{changeset | data: data}, clinics: clinics)
    end
  end

  def show(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    render(conn, "show.html", practitioner: practitioner)
  end

  def edit(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    changeset = Account.change_practitioner(practitioner)
    data = Account.load_clinics(changeset.data)
    clinics = OnlineDr.Center.list_clinics()
    render(conn, "edit.html", practitioner: practitioner, changeset: %{changeset | data: data}, clinics: clinics)
  end

  def update(conn, %{"id" => id, "practitioner" => practitioner_params}) do
    practitioner = Account.get_practitioner!(id)

    case Account.update_practitioner(practitioner, practitioner_params) do
      {:ok, practitioner} ->
        conn
        |> put_flash(:info, "Practitioner updated successfully.")
        |> redirect(to: Routes.practitioner_path(conn, :show, practitioner))

      {:error, %Ecto.Changeset{} = changeset} ->
        data = Account.load_clinics(changeset.data)
        clinics = OnlineDr.Center.list_clinics()
        render(conn, "edit.html", practitioner: practitioner, changeset: %{changeset | data: data}, clinics: clinics)
    end
  end

  def delete(conn, %{"id" => id}) do
    practitioner = Account.get_practitioner!(id)
    {:ok, _practitioner} = Account.delete_practitioner(practitioner)

    conn
    |> put_flash(:info, "Practitioner deleted successfully.")
    |> redirect(to: Routes.practitioner_path(conn, :index))
  end

  defp load_kinds(conn, _) do
    assign(conn, :kinds, Account.list_alphabetical_kinds())
  end


end
