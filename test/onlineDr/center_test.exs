defmodule OnlineDr.CenterTest do
  use OnlineDr.DataCase

  alias OnlineDr.Center

  describe "clinics" do
    alias OnlineDr.Center.Clinic

    import OnlineDr.CenterFixtures

    @invalid_attrs %{address: nil, name: nil, phone_number: nil}

    test "list_clinics/0 returns all clinics" do
      clinic = clinic_fixture()
      assert Center.list_clinics() == [clinic]
    end

    test "get_clinic!/1 returns the clinic with given id" do
      clinic = clinic_fixture()
      assert Center.get_clinic!(clinic.id) == clinic
    end

    test "create_clinic/1 with valid data creates a clinic" do
      valid_attrs = %{address: "some address", name: "some name", phone_number: "some phone_number"}

      assert {:ok, %Clinic{} = clinic} = Center.create_clinic(valid_attrs)
      assert clinic.address == "some address"
      assert clinic.name == "some name"
      assert clinic.phone_number == "some phone_number"
    end

    test "create_clinic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Center.create_clinic(@invalid_attrs)
    end

    test "update_clinic/2 with valid data updates the clinic" do
      clinic = clinic_fixture()
      update_attrs = %{address: "some updated address", name: "some updated name", phone_number: "some updated phone_number"}

      assert {:ok, %Clinic{} = clinic} = Center.update_clinic(clinic, update_attrs)
      assert clinic.address == "some updated address"
      assert clinic.name == "some updated name"
      assert clinic.phone_number == "some updated phone_number"
    end

    test "update_clinic/2 with invalid data returns error changeset" do
      clinic = clinic_fixture()
      assert {:error, %Ecto.Changeset{}} = Center.update_clinic(clinic, @invalid_attrs)
      assert clinic == Center.get_clinic!(clinic.id)
    end

    test "delete_clinic/1 deletes the clinic" do
      clinic = clinic_fixture()
      assert {:ok, %Clinic{}} = Center.delete_clinic(clinic)
      assert_raise Ecto.NoResultsError, fn -> Center.get_clinic!(clinic.id) end
    end

    test "change_clinic/1 returns a clinic changeset" do
      clinic = clinic_fixture()
      assert %Ecto.Changeset{} = Center.change_clinic(clinic)
    end
  end
end
