defmodule App1.AutoTest do
  alias App1.Auto
  use App1.DataCase

  alias App1.Auto

  describe "cars" do
    alias App1.Auto.Car

    import App1.AdminFixtures
    import App1.AutoFixtures

    @invalid_attrs %{name: nil}

    test "list_car/0 return all cars" do
      car = car_fixture()
      assert Auto.list_cars() == [car]
    end

    test "get_car!/1 return the car with given id" do
      car = car_fixture()
      assert Auto.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      user = user_fixture()

      valid_attrs =
        %{user_id: user.id, name: "some name"}

      assert {:ok, %Car{} = car} = Auto.create_car(valid_attrs)
      assert car.name == "some name"
      assert car.user_id == user.id
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auto.create_car(@invalid_attrs)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Auto.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Auto.get_car!(car.id) end
    end

    test "change_car/1 return a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Auto.change_car(car)
    end
  end
end
