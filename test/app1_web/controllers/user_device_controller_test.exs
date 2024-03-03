defmodule App1Web.UserDeviceControllerTest do
  use App1Web.ConnCase

  import App1.DeviceFixtures

  @create_attrs %{ user_id: 1, name: "some name"}
  @update_attrs %{ user_id: 2, name: "some updated name"}
  @invalid_attrs %{user_id: nil, name: nil}

  describe "index" do
    test "lists all user_devices", %{conn: conn} do
      conn = get(conn, ~p"/user_devices")
      assert html_response(conn, 200) =~ "Listing User devices"
    end
  end

  describe "new user_device" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/user_devices")
      assert html_response(conn, 200)
    end
  end

  describe "create user_device" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/user_devices", user_device: @create_attrs)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/user_devices", user_device: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User device"
    end
  end

  describe "edit user_device" do
    setup [:create_user_device]

    test "renders form for editing chosen user_device", %{conn: conn, user_device: user_device} do
      conn = get(conn, ~p"/user_devices/#{user_device}/edit")
      assert html_response(conn, 200) =~ "Edit User device"
    end
  end

  describe "update user_device" do
    setup [:create_user_device]

    test "redirects when data is valid", %{conn: conn, user_device: user_device} do
      conn = put(conn, ~p"/user_devices/#{user_device}" )
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, user_device: user_device} do
      conn = put(conn, ~p"/user_devices/#{user_device}", user_device: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User device"
    end
  end

  describe "delete user_device" do
    setup [:create_user_device]

    test "deletes chosen user_device", %{conn: conn, user_device: user_device} do
      conn = delete(conn, ~p"/user_devices/#{user_device}")
            assert html_response(conn, 302)

      assert_error_sent 404, fn ->
        get(conn, ~p"/user_devices/#{user_device}")
      end
    end
  end

  defp create_user_device(_) do
    user_device = user_device_fixture()
    %{user_device: user_device}
  end
end
