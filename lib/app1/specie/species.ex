defmodule App1.Specie.Species do
  use Ecto.Schema
  import Ecto.Changeset

  schema "species" do
    field :name, :string
    has_many :pets, App1.Animal.Pet
    has_many :users, App1.Admin.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(species, attrs) do
    species
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
