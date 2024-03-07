defmodule App1.AnimalFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Animal` context.
  """

  @doc """
  Generate a pet.
  """
  def pet_fixture(attrs \\ %{}) do
    {:ok, pet} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Animal.create_pet()

    pet
  end
end
