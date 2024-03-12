defmodule App1Web.PetController do
  use App1Web, :controller

  alias App1.Specie
  alias App1.Animal
  alias App1.Animal.Pet

  def index(conn, _params) do
    pets = Animal.list_pets()
    render(conn, :index, pets: pets)
  end

  def new(conn, %{"user_id" => user_id}) do
    changeset = Animal.change_pet(%Pet{user_id: user_id})
    species = Specie.list_species()
    render(conn, :new, changeset: changeset, species: species)
  end

  def create(conn, %{"pet" => pet_params}) do
    case Animal.create_pet(pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet created successfully.")
        |> redirect(to: ~p"/users/#{pet.user_id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        species = Specie.list_species()

        render(conn, :new, changeset: changeset, species: species)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Animal.show_pet(id)
    render(conn, :show, pet: pet)
  end

  def edit(conn, %{"id" => id}) do
    pet = Animal.get_pet!(id)
    species = Specie.list_species()
    changeset = Animal.change_pet(pet)

    render(conn, :edit, pet: pet, changeset: changeset, species: species)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Animal.get_pet!(id)

    case Animal.update_pet(pet, pet_params) do
      {:ok, pet} ->
        conn
        |> put_flash(:info, "Pet updated successfully.")
        |> redirect(to: ~p"/pets/#{pet}")

      {:error, %Ecto.Changeset{} = changeset} ->
        species = Specie.list_species()
        render(conn, :edit, pet: pet, changeset: changeset, species: species)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Animal.get_pet!(id)
    {:ok, _pet} = Animal.delete_pet(pet)

    conn
    |> put_flash(:info, "Pet deleted successfully.")
    |> redirect(to: ~p"/users/#{pet.user_id}")
  end
end
