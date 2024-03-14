defmodule App1Web.CarControllerTest do
  alias App1.AdminFixtures
  use App1Web.ConnCase

  import App1.AutoFixtures

  @invalid_attrs %{"user_id" => nil, "name" => nil}

  describe "new car" do
    test "render form", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200)
    end
  end

  describe "create car" do
    setup [:create_user]

    test "redirects to show when data is valid", %{conn: conn, user: user} do
      create_attrs = %{user_id: user.id, name: "some name"}
      conn = post(conn, ~p"/cars", car: create_attrs)
      assert redirected_to(conn) == ~p"/users/#{user.id}"
    end

    test "renders error when data in invalid", %{conn: conn} do
      conn = post(conn, ~p"/cars", car: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Car"
      assert Map.get(conn.params, "car") == @invalid_attrs
    end
  end

  defp create_user(_) do
    user = AdminFixtures.user_fixture()
    %{user: user}
  end
end
