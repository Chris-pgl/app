defmodule App1.Auto do
  @moduledoc """
  The car context.
  """

  import Ecto.Query, warn: false
  alias App1.Repo

  alias App1.Auto.Car

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Car{}, ...]

  """
  def list_cars do
    Repo.all(Car)
  end

  @doc """
    Get a single car

    ## Examples

    iex> get_car!(123)
    %Car{}

    iex> get_car!(222)
    **(Ecto.NoResultsError)
  """
  def get_car!(id), do: Repo.get!(Car, id)

  @doc """
    Create a car.

    ## Examples
    iex> create_car(%{filed: value})
    {:ok, %Car{}}

    iex> create_car(%{field: bad_value})
    {:error, %Ecto.Changest{}}
  """
  def create_car(attrs \\ %{}) do
    %Car{}
    |> Car.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Deletes a car.

    ## Examples
    iex> delete_car(car)
    {:ok, %Car{}}

    iex> delete_car(car)
    {:error, %Ecto.Changeset{}}
  """
  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

  @doc """
    Returns an '%Ecto.Changeset{}' for tracking car changes.

    ## Examples
    iex> change_car(car)
    %Ecto.Changeset{data: %Pet{}}
  """
  def change_car(%Car{} = car, attrs \\ %{}) do
    Car.changeset(car, attrs)
  end
end
