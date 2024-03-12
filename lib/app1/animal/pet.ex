defmodule App1.Animal.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :name, :string
    belongs_to :species, App1.Specie.Species
    belongs_to :user, App1.Admin.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:species_id, :user_id, :name])
    |> validate_required([:species_id, :user_id, :name])
    |> foreign_key_constraint(:user_id, name: "pets_user_id_fkey")
  end
end
