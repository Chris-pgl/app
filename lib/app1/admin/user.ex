defmodule App1.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :address, :string
    field :phone, :string
    field :email, :string

    belongs_to :country, App1.Admim.Country

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :address, :phone, :email, :country_id])
    |> validate_required([:name, :address, :phone, :email, :country_id])
  end
end