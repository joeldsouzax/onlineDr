defmodule OnlineDrWeb.ClinicControllerTest do
  use OnlineDrWeb.ConnCase

  import OnlineDr.CenterFixtures

  @create_attrs %{address: "some address", name: "some name", phone_number: "some phone_number"}
  @update_attrs %{address: "some updated address", name: "some updated name", phone_number: "some updated phone_number"}
  @invalid_attrs %{address: nil, name: nil, phone_number: nil}

  describe "index" do
    test "lists all clinics", %{conn: conn} do
      conn = get(conn, Routes.clinic_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Clinics"
    end
  end

  describe "new clinic" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.clinic_path(conn, :new))
      assert html_response(conn, 200) =~ "New Clinic"
    end
  end

  describe "create clinic" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.clinic_path(conn, :create), clinic: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.clinic_path(conn, :show, id)

      conn = get(conn, Routes.clinic_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Clinic"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.clinic_path(conn, :create), clinic: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Clinic"
    end
  end

  describe "edit clinic" do
    setup [:create_clinic]

    test "renders form for editing chosen clinic", %{conn: conn, clinic: clinic} do
      conn = get(conn, Routes.clinic_path(conn, :edit, clinic))
      assert html_response(conn, 200) =~ "Edit Clinic"
    end
  end

  describe "update clinic" do
    setup [:create_clinic]

    test "redirects when data is valid", %{conn: conn, clinic: clinic} do
      conn = put(conn, Routes.clinic_path(conn, :update, clinic), clinic: @update_attrs)
      assert redirected_to(conn) == Routes.clinic_path(conn, :show, clinic)

      conn = get(conn, Routes.clinic_path(conn, :show, clinic))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, clinic: clinic} do
      conn = put(conn, Routes.clinic_path(conn, :update, clinic), clinic: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Clinic"
    end
  end

  describe "delete clinic" do
    setup [:create_clinic]

    test "deletes chosen clinic", %{conn: conn, clinic: clinic} do
      conn = delete(conn, Routes.clinic_path(conn, :delete, clinic))
      assert redirected_to(conn) == Routes.clinic_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.clinic_path(conn, :show, clinic))
      end
    end
  end

  defp create_clinic(_) do
    clinic = clinic_fixture()
    %{clinic: clinic}
  end
end
