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

    attrs = Map.merge(attrs, %{species_id: species.id, user_id: user.id})

    {:ok, pet} =
      attrs
      |> Enum.into(%{name: "some name"})
      |> App1.Animal.create_pet()

    pet
  end
end
