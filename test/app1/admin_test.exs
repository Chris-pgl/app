defmodule App1.AdminTest do
  use App1.DataCase

  alias App1.Admin
  # import App1.DeviceFixtures

  describe "countries" do
    alias App1.Admin.Country

    import App1.AdminFixtures

    @invalid_attrs %{name: nil}

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Admin.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Admin.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Country{} = country} = Admin.create_country(valid_attrs)
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Country{} = country} = Admin.update_country(country, update_attrs)
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_country(country, @invalid_attrs)
      assert country == Admin.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Admin.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Admin.change_country(country)
    end
  end

  describe "users" do
    alias App1.Admin.User

    import App1.AdminFixtures

    @invalid_attrs %{name: nil, address: nil, phone: nil, email: nil, country_id: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Admin.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      country = country_fixture()

      valid_attrs = %{
        name: "some name",
        address: "some address",
        phone: "some phone",
        email: "some email",
        country_id: country.id
      }

      assert {:ok, %User{} = user} = Admin.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.address == "some address"
      assert user.phone == "some phone"
      assert user.email == "some email"
      assert user.country_id == country.id
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      country = country_fixture()

      user = user_fixture(%{country_id: country.id})

      update_attrs = %{
        name: "some updated name",
        address: "some updated address",
        phone: "some updated phone",
        email: "some updated email",
        country_id: country.id
      }

      assert {:ok, %User{} = user} = Admin.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.address == "some updated address"
      assert user.phone == "some updated phone"
      assert user.email == "some updated email"
      assert user.country_id == country.id
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end
end
