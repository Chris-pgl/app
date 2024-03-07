defmodule App1Web.SpeciesControllerTest do
  use App1Web.ConnCase

  import App1.SpecieFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all species", %{conn: conn} do
      conn = get(conn, ~p"/species")
      assert html_response(conn, 200) =~ "Listing Species"
    end
  end

  describe "new species" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/species/new")
      assert html_response(conn, 200) =~ "New Species"
    end
  end

  describe "create species" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/species", species: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/species/#{id}"

      conn = get(conn, ~p"/species/#{id}")
      assert html_response(conn, 200) =~ "Species #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/species", species: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Species"
    end
  end

  describe "edit species" do
    setup [:create_species]

    test "renders form for editing chosen species", %{conn: conn, species: species} do
      conn = get(conn, ~p"/species/#{species}/edit")
      assert html_response(conn, 200) =~ "Edit Species"
    end
  end

  describe "update species" do
    setup [:create_species]

    test "redirects when data is valid", %{conn: conn, species: species} do
      conn = put(conn, ~p"/species/#{species}", species: @update_attrs)
      assert redirected_to(conn) == ~p"/species/#{species}"

      conn = get(conn, ~p"/species/#{species}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, species: species} do
      conn = put(conn, ~p"/species/#{species}", species: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Species"
    end
  end

  describe "delete species" do
    setup [:create_species]

    test "deletes chosen species", %{conn: conn, species: species} do
      conn = delete(conn, ~p"/species/#{species}")
      assert redirected_to(conn) == ~p"/species"

      assert_error_sent 404, fn ->
        get(conn, ~p"/species/#{species}")
      end
    end
  end

  defp create_species(_) do
    species = species_fixture()
    %{species: species}
  end
end
