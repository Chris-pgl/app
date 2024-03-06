defmodule App1.Device.UserDevice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_devices" do
    field :name, :string

    belongs_to :user, App1.Admin.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_device, attrs) do
    user_device
    |> cast(attrs, [:user_id, :name])
    |> validate_required([:user_id, :name])
    |> foreign_key_constraint(:user_id, name: "user_devices_user_id_fkey")
  end
end
