defmodule App1.AnimalFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Animal` context.
  """
alias App1.SpecieFixtures
alias App1.AdminFixtures

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    user = AdminFixtures.user_fixture()
    species = SpecieFixtures.species_fixture()
    species_id = species.id
    user_id = user.id
    attrs_with_user_species = Map.merge(attrs, %{species_id: species_id, user_id: user_id})

    {:ok, pet} =
      attrs_with_user_species
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Animal.create_pet()

    pet
  end
end
