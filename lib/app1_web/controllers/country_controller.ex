defmodule App1Web.CountryController do
  use App1Web, :controller

  alias App1.Admin
  alias App1.Admin.Country

  def index(conn, _params) do
    countries = Admin.list_countries()
    render(conn, :index, countries: countries)
  end

  def new(conn, _params) do
    changeset = Admin.change_country(%Country{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"country" => country_params}) do
    case Admin.create_country(country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country created successfully.")
        |> redirect(to: ~p"/countries/#{country}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    country = Admin.get_country!(id)
    render(conn, :show, country: country)
  end

  def edit(conn, %{"id" => id}) do
    country = Admin.get_country!(id)
    changeset = Admin.change_country(country)
    render(conn, :edit, country: country, changeset: changeset)
  end

  def update(conn, %{"id" => id, "country" => country_params}) do
    country = Admin.get_country!(id)

    case Admin.update_country(country, country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country updated successfully.")
        |> redirect(to: ~p"/countries/#{country}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, country: country, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    country = Admin.get_country!(id)
    {:ok, _country} = Admin.delete_country(country)

    conn
    |> put_flash(:info, "Country deleted successfully.")
    |> redirect(to: ~p"/countries")
  end
end
