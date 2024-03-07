defmodule App1.SpecieTest do
  use App1.DataCase

  alias App1.Specie

  describe "species" do
    alias App1.Specie.Species

    import App1.SpecieFixtures

    @invalid_attrs %{name: nil}

    test "list_species/0 returns all species" do
      species = species_fixture()
      assert Specie.list_species() == [species]
    end

    test "get_species!/1 returns the species with given id" do
      species = species_fixture()
      assert Specie.get_species!(species.id) == species
    end

    test "create_species/1 with valid data creates a species" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Species{} = species} = Specie.create_species(valid_attrs)
      assert species.name == "some name"
    end

    test "create_species/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Specie.create_species(@invalid_attrs)
    end

    test "update_species/2 with valid data updates the species" do
      species = species_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Species{} = species} = Specie.update_species(species, update_attrs)
      assert species.name == "some updated name"
    end

    test "update_species/2 with invalid data returns error changeset" do
      species = species_fixture()
      assert {:error, %Ecto.Changeset{}} = Specie.update_species(species, @invalid_attrs)
      assert species == Specie.get_species!(species.id)
    end

    test "delete_species/1 deletes the species" do
      species = species_fixture()
      assert {:ok, %Species{}} = Specie.delete_species(species)
      assert_raise Ecto.NoResultsError, fn -> Specie.get_species!(species.id) end
    end

    test "change_species/1 returns a species changeset" do
      species = species_fixture()
      assert %Ecto.Changeset{} = Specie.change_species(species)
    end
  end
end
