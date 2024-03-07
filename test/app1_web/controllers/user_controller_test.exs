defmodule App1Web.UserControllerTest do
  alias App1.AdminFixtures
  use App1Web.ConnCase

  import App1.AdminFixtures

  @invalid_attrs %{
    "address" => nil,
    "countries" => nil,
    "country_id" => nil,
    "name" => nil,
    "phone" => nil
  }

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      country = AdminFixtures.country_fixture()
      create_attrs = %{
        name: "some name",
        address: "some address",
        phone: "some phone",
        email: "some email",
        country_id: country.id,
        countries: "some countries"
      }
      conn = post(conn, ~p"/users", user: create_attrs)
      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/users/#{id}"

    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/users", user: @invalid_attrs)
      assert html_response(conn, 200) =~ "New User"
      assert Map.get(conn.params, "user") == @invalid_attrs
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, ~p"/users/#{user}/edit")
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      country = AdminFixtures.country_fixture()
      update_attrs = %{
        name: "some updated name",
        address: "some updated address",
        phone: "some updated phone",
        email: "some updated email",
        country_id: country.id,
        countries: "some updated countries"
      }
      conn = put(conn, ~p"/users/#{user}", user: update_attrs)
      assert redirected_to(conn) == ~p"/users/#{user}"

      conn = get(conn, ~p"/users/#{user}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, ~p"/users/#{user}", user: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, ~p"/users/#{user}")
      assert redirected_to(conn) == ~p"/users"

      assert_error_sent 404, fn ->
        get(conn, ~p"/users/#{user}")
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
