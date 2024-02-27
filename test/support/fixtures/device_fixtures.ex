defmodule App1.DeviceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App1.Device` context.
  """

  @doc """
  Generate a user_device.
  """
  def user_device_fixture(attrs \\ %{}) do
    {:ok, user_device} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> App1.Device.create_user_device()

    user_device
  end
end
