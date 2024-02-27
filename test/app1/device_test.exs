defmodule App1.DeviceTest do
  use App1.DataCase

  alias App1.Device

  describe "user_devices" do
    alias App1.Device.UserDevice

    import App1.DeviceFixtures

    @invalid_attrs %{name: nil}

    test "list_user_devices/0 returns all user_devices" do
      user_device = user_device_fixture()
      assert Device.list_user_devices() == [user_device]
    end

    test "get_user_device!/1 returns the user_device with given id" do
      user_device = user_device_fixture()
      assert Device.get_user_device!(user_device.id) == user_device
    end

    test "create_user_device/1 with valid data creates a user_device" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %UserDevice{} = user_device} = Device.create_user_device(valid_attrs)
      assert user_device.name == "some name"
    end

    test "create_user_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Device.create_user_device(@invalid_attrs)
    end

    test "update_user_device/2 with valid data updates the user_device" do
      user_device = user_device_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %UserDevice{} = user_device} = Device.update_user_device(user_device, update_attrs)
      assert user_device.name == "some updated name"
    end

    test "update_user_device/2 with invalid data returns error changeset" do
      user_device = user_device_fixture()
      assert {:error, %Ecto.Changeset{}} = Device.update_user_device(user_device, @invalid_attrs)
      assert user_device == Device.get_user_device!(user_device.id)
    end

    test "delete_user_device/1 deletes the user_device" do
      user_device = user_device_fixture()
      assert {:ok, %UserDevice{}} = Device.delete_user_device(user_device)
      assert_raise Ecto.NoResultsError, fn -> Device.get_user_device!(user_device.id) end
    end

    test "change_user_device/1 returns a user_device changeset" do
      user_device = user_device_fixture()
      assert %Ecto.Changeset{} = Device.change_user_device(user_device)
    end
  end
end
