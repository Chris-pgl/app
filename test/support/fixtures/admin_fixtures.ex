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

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    country = country_fixture()
    attrs_with_country_id = Map.put(attrs, :country_id, country.id)

    {:ok, user} =
      attrs_with_country_id
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> App1.Admin.create_user()

    user
  end

  def user_fixture_without_country(attrs) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        name: "some name",
        phone: "some phone"
      })
      |> App1.Admin.create_user()

    user
  end
end
