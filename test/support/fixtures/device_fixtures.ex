defmodule App1.DeviceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Device` context.
  """
alias App1.AdminFixtures

  @doc """
  Generate a user_device.
  """
  def user_device_fixture(attrs \\ %{}) do
    user = AdminFixtures.user_fixture()
    user_id = user.id
    attrs_with_user_id = Map.put(attrs, :user_id, user_id)
    {:ok, user_device} =
      attrs_with_user_id
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Device.create_user_device()

    user_device

  end
end
