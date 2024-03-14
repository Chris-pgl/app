defmodule App1Web.CarController do
  use App1Web, :controller

  alias App1.Auto
  alias App1.Auto.Car

  def new(conn, %{"user_id" => user_id}) do
    changeset = Auto.change_car(%Car{user_id: user_id})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"car" => car_params}) do
    case Auto.create_car(car_params) do
      {:ok, car} ->
        conn
        |> put_flash(:info, "Car created successfully.")
        |> redirect(to: ~p"/users/#{car.user_id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = Auto.get_car!(id)
    {:ok, _car} = Auto.delete_car(car)

    conn
    |> put_flash(:info, "Car deleted successfully.")
    |> redirect(to: ~p"/users/#{car.user_id}")
  end
end
