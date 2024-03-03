defmodule App1Web.UserDeviceController do
  use App1Web, :controller

  alias App1.Admin
  alias App1.Device
  alias App1.Device.UserDevice

  def index(conn, _params) do
    user_devices = Device.list_user_devices()
    render(conn, :index, user_devices: user_devices)
  end

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

  def show(conn, %{"id" => id}) do
    user_device = Device.get_user_device!(id)
    render(conn, :show, user_device: user_device)
  end

  def edit(conn, %{"id" => id}) do
    user_device = Device.get_user_device!(id)
    changeset = Device.change_user_device(user_device)
    users = Admin.list_users()
    render(conn, :edit, user_device: user_device, changeset: changeset, users: users)
  end

  def update(conn, %{"id" => id, "user_device" => user_device_params}) do
    user_device = Device.get_user_device!(id)

    case Device.update_user_device(user_device, user_device_params) do
      {:ok, user_device} ->
        conn
        |> put_flash(:info, "User device updated successfully.")
        |> redirect(to: ~p"/user_devices/#{user_device}")

      {:error, %Ecto.Changeset{} = changeset} ->
        users = Admin.list_users()
        render(conn, :edit, user_device: user_device, changeset: changeset, users: users)
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
