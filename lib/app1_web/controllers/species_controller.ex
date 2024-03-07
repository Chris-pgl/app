defmodule App1Web.SpeciesController do
  use App1Web, :controller

  alias App1.Specie
  alias App1.Specie.Species

  def index(conn, _params) do
    species = Specie.list_species()
    render(conn, :index, species_collection: species)
  end

  def new(conn, _params) do
    changeset = Specie.change_species(%Species{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"species" => species_params}) do
    case Specie.create_species(species_params) do
      {:ok, species} ->
        conn
        |> put_flash(:info, "Species created successfully.")
        |> redirect(to: ~p"/species/#{species}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    species = Specie.get_species!(id)
    render(conn, :show, species: species)
  end

  def edit(conn, %{"id" => id}) do
    species = Specie.get_species!(id)
    changeset = Specie.change_species(species)
    render(conn, :edit, species: species, changeset: changeset)
  end

  def update(conn, %{"id" => id, "species" => species_params}) do
    species = Specie.get_species!(id)

    case Specie.update_species(species, species_params) do
      {:ok, species} ->
        conn
        |> put_flash(:info, "Species updated successfully.")
        |> redirect(to: ~p"/species/#{species}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, species: species, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    species = Specie.get_species!(id)
    {:ok, _species} = Specie.delete_species(species)

    conn
    |> put_flash(:info, "Species deleted successfully.")
    |> redirect(to: ~p"/species")
  end
end
