defmodule App1.AdminFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Admin` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Admin.create_country()

    country
  end
end
