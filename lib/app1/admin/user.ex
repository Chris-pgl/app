defmodule App1.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :address, :string
    field :phone, :string
    field :email, :string

    belongs_to :country, App1.Admin.Country
    has_many :user_devices, App1.Device.UserDevice
    has_many :pets, App1.Animal.Pet
    has_many :species, App1.Specie.Species

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :address, :phone, :email, :country_id])
    |> validate_required([:name, :address, :phone, :country_id])
    |> foreign_key_constraint(:country_id, name: :users_country_id_fkey)
  end
end
