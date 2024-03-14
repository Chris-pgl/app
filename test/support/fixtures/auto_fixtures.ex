defmodule App1.AutoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Auto` context.
  """

  alias App1.AdminFixtures

  def car_fixture(attrs \\ %{}) do
    user = AdminFixtures.user_fixture()

    attrs = Map.put(attrs, :user_id, user.id)

    {:ok, car} =
      attrs
      |> Enum.into(%{name: "some name"})
      |> App1.Auto.create_car()

    car
  end
end
