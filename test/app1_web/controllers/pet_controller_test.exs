defmodule App1Web.PetControllerTest do
  alias App1.AdminFixtures
  alias App1.SpecieFixtures

  use App1Web.ConnCase

  import App1.AnimalFixtures

  @invalid_attrs %{
    "user_id" => nil,
    "species_id" => nil,
    "name" => nil
  }

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, ~p"/pets")
      assert html_response(conn, 200) =~ "Listing Pets"
    end
  end

  describe "new pet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/users")
      assert html_response(conn, 200)
    end
  end

  describe "create pet" do
    test "redirects to show when data is valid", %{conn: conn} do
      species = SpecieFixtures.species_fixture()
      user = AdminFixtures.user_fixture()

      create_attrs =
        %{user_id: user.id, species_id: species.id, name: "some name"}

      conn = post(conn, ~p"/pets", pet: create_attrs)
      assert redirected_to(conn) == ~p"/users/#{user.id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pets", pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pet"
    end
  end

  describe "edit pet" do
    setup [:create_pet]

    test "renders form for editing chosen pet", %{conn: conn, pet: pet} do
      conn = get(conn, ~p"/pets/#{pet}/edit")
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "redirects when data is valid", %{conn: conn, pet: pet} do
      user = AdminFixtures.user_fixture()
      species = SpecieFixtures.species_fixture()

      update_attrs =
        %{user_id: user.id, species_id: species.id, name: "some updated name"}

      conn = put(conn, ~p"/pets/#{pet}", pet: update_attrs)
      assert redirected_to(conn) == ~p"/pets/#{pet}"

      conn = get(conn, ~p"/pets/#{pet}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, ~p"/pets/#{pet}", pet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pet"
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, ~p"/pets/#{pet}")
      assert redirected_to(conn) == ~p"/users/#{pet.user_id}"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pets/#{pet}")
      end
    end
  end

  defp create_pet(_) do
    pet = pet_fixture()
    %{pet: pet}
  end
end
