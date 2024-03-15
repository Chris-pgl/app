defmodule App1.Auto.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :name, :string

    belongs_to :user, App1.Admin.User

    timestamps(type: :utc_datetime)
  end

  def changeset(car, attrs) do
    car
    |> cast(attrs, [:user_id, :name])
    |> validate_required([:user_id, :name])
  end
end
