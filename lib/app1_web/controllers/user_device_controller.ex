defmodule App1Web.UserDeviceController do
  use App1Web, :controller

  alias App1.Device
  alias App1.Device.UserDevice



  def new(conn, %{"user_id" => user_id}) do
    changeset = Device.change_user_device(%UserDevice{user_id: user_id})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user_device" => user_device_params}) do
    case Device.create_user_device(user_device_params) do
      {:ok, user_device} ->
        conn
        |> put_flash(:info, "User device created successfully.")
        |> redirect(to: ~p"/users/#{user_device.user_id}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end




  def delete(conn, %{"id" => id}) do
    user_device = Device.get_user_device!(id)
    {:ok, _user_device} = Device.delete_user_device(user_device)

    conn
    |> put_flash(:info, "User device deleted successfully.")
    |> redirect(to: ~p"/users/#{user_device.user_id}")
  end
end
