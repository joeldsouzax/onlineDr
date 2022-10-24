defmodule OnlineDr.AccountTest do
  use OnlineDr.DataCase

  alias OnlineDr.Account

  describe "practitioners" do
    alias OnlineDr.Account.Practitioner

    import OnlineDr.AccountFixtures

    @invalid_attrs %{description: nil, name: nil, phone_number: nil}

    test "list_practitioners/0 returns all practitioners" do
      practitioner = practitioner_fixture()
      assert Account.list_practitioners() == [practitioner]
    end

    test "get_practitioner!/1 returns the practitioner with given id" do
      practitioner = practitioner_fixture()
      assert Account.get_practitioner!(practitioner.id) == practitioner
    end

    test "create_practitioner/1 with valid data creates a practitioner" do
      valid_attrs = %{description: "some description", name: "some name", phone_number: "some phone_number"}

      assert {:ok, %Practitioner{} = practitioner} = Account.create_practitioner(valid_attrs)
      assert practitioner.description == "some description"
      assert practitioner.name == "some name"
      assert practitioner.phone_number == "some phone_number"
    end

    test "create_practitioner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_practitioner(@invalid_attrs)
    end

    test "update_practitioner/2 with valid data updates the practitioner" do
      practitioner = practitioner_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", phone_number: "some updated phone_number"}

      assert {:ok, %Practitioner{} = practitioner} = Account.update_practitioner(practitioner, update_attrs)
      assert practitioner.description == "some updated description"
      assert practitioner.name == "some updated name"
      assert practitioner.phone_number == "some updated phone_number"
    end

    test "update_practitioner/2 with invalid data returns error changeset" do
      practitioner = practitioner_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_practitioner(practitioner, @invalid_attrs)
      assert practitioner == Account.get_practitioner!(practitioner.id)
    end

    test "delete_practitioner/1 deletes the practitioner" do
      practitioner = practitioner_fixture()
      assert {:ok, %Practitioner{}} = Account.delete_practitioner(practitioner)
      assert_raise Ecto.NoResultsError, fn -> Account.get_practitioner!(practitioner.id) end
    end

    test "change_practitioner/1 returns a practitioner changeset" do
      practitioner = practitioner_fixture()
      assert %Ecto.Changeset{} = Account.change_practitioner(practitioner)
    end
  end
end
