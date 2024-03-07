defmodule App1.AnimalTest do
  use App1.DataCase

  alias App1.Animal

  describe "pets" do
    alias App1.Animal.Pet

    import App1.AnimalFixtures

    @invalid_attrs %{name: nil}

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Animal.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Animal.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Pet{} = pet} = Animal.create_pet(valid_attrs)
      assert pet.name == "some name"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animal.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Pet{} = pet} = Animal.update_pet(pet, update_attrs)
      assert pet.name == "some updated name"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Animal.update_pet(pet, @invalid_attrs)
      assert pet == Animal.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Animal.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Animal.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Animal.change_pet(pet)
    end
  end
end
