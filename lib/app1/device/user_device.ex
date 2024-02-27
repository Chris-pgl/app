defmodule App1.Device.UserDevice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_devices" do
    field :name, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_device, attrs) do
    user_device
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
