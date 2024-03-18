defmodule App1Web.UserDeviceControllerTest do
  alias App1.AdminFixtures
  use App1Web.ConnCase

  import App1.DeviceFixtures

  @invalid_attrs %{"user_id" => nil, "name" => nil}

  describe "new user_device" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/user_devices/new?user_id=5")
      assert html_response(conn, 200)
    end
  end

  describe "create user_device" do
    setup [:create_user]

    test "redirects to show when data is valid", %{conn: conn, user: user} do
      create_attrs = %{user_id: user.id, name: "some name"}
      conn = post(conn, ~p"/user_devices", user_device: create_attrs)
      assert redirected_to(conn) == ~p"/users/#{user.id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/user_devices", user_device: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User device"
      assert Map.get(conn.params, "user_device") == @invalid_attrs
    end
  end

  describe "delete user_device" do
    setup [:create_user_device]

    test "deletes chosen user_device", %{conn: conn, user_device: user_device} do
      conn = delete(conn, ~p"/user_devices/#{user_device}")
      assert html_response(conn, 302)
    end
  end

  defp create_user(_) do
    user = AdminFixtures.user_fixture()
    %{user: user}
  end

  defp create_user_device(_) do
    user_device = user_device_fixture()
    %{user_device: user_device}
  end
end
