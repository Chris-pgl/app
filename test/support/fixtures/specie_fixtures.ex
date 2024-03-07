defmodule App1.SpecieFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Specie` context.
  """

  @doc """
  Generate a species.
  """
  def species_fixture(attrs \\ %{}) do
    {:ok, species} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Specie.create_species()

    species
  end
end
