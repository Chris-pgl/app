defmodule App1.Admin.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :name, :string

    has_many :user, App1.Admin.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(country, attrs \\ %{}) do
    country
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
