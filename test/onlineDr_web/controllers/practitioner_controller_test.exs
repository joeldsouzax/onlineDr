defmodule OnlineDrWeb.PractitionerControllerTest do
  use OnlineDrWeb.ConnCase

  import OnlineDr.AccountFixtures

  @create_attrs %{description: "some description", name: "some name", phone_number: "some phone_number"}
  @update_attrs %{description: "some updated description", name: "some updated name", phone_number: "some updated phone_number"}
  @invalid_attrs %{description: nil, name: nil, phone_number: nil}

  describe "index" do
    test "lists all practitioners", %{conn: conn} do
      conn = get(conn, Routes.practitioner_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Practitioners"
    end
  end

  describe "new practitioner" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.practitioner_path(conn, :new))
      assert html_response(conn, 200) =~ "New Practitioner"
    end
  end

  describe "create practitioner" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.practitioner_path(conn, :create), practitioner: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.practitioner_path(conn, :show, id)

      conn = get(conn, Routes.practitioner_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Practitioner"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.practitioner_path(conn, :create), practitioner: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Practitioner"
    end
  end

  describe "edit practitioner" do
    setup [:create_practitioner]

    test "renders form for editing chosen practitioner", %{conn: conn, practitioner: practitioner} do
      conn = get(conn, Routes.practitioner_path(conn, :edit, practitioner))
      assert html_response(conn, 200) =~ "Edit Practitioner"
    end
  end

  describe "update practitioner" do
    setup [:create_practitioner]

    test "redirects when data is valid", %{conn: conn, practitioner: practitioner} do
      conn = put(conn, Routes.practitioner_path(conn, :update, practitioner), practitioner: @update_attrs)
      assert redirected_to(conn) == Routes.practitioner_path(conn, :show, practitioner)

      conn = get(conn, Routes.practitioner_path(conn, :show, practitioner))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, practitioner: practitioner} do
      conn = put(conn, Routes.practitioner_path(conn, :update, practitioner), practitioner: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Practitioner"
    end
  end

  describe "delete practitioner" do
    setup [:create_practitioner]

    test "deletes chosen practitioner", %{conn: conn, practitioner: practitioner} do
      conn = delete(conn, Routes.practitioner_path(conn, :delete, practitioner))
      assert redirected_to(conn) == Routes.practitioner_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.practitioner_path(conn, :show, practitioner))
      end
    end
  end

  defp create_practitioner(_) do
    practitioner = practitioner_fixture()
    %{practitioner: practitioner}
  end
end
