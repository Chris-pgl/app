defmodule App1Web.UserDeviceController do
  use App1Web, :controller

  alias App1.Device
  alias App1.Device.UserDevice

  def index(conn, _params) do
    user_devices = Device.list_user_devices()
    render(conn, :index, user_devices: user_devices)
  end

  def new(conn, _params) do
    changeset = Device.change_user_device(%UserDevice{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user_device" => user_device_params}) do
    case Device.create_user_device(user_device_params) do
      {:ok, user_device} ->
        conn
        |> put_flash(:info, "User device created successfully.")
        |> redirect(to: ~p"/user_devices/#{user_device}")

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
    render(conn, :edit, user_device: user_device, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user_device" => user_device_params}) do
    user_device = Device.get_user_device!(id)

    case Device.update_user_device(user_device, user_device_params) do
      {:ok, user_device} ->
        conn
        |> put_flash(:info, "User device updated successfully.")
        |> redirect(to: ~p"/user_devices/#{user_device}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, user_device: user_device, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_device = Device.get_user_device!(id)
    {:ok, _user_device} = Device.delete_user_device(user_device)

    conn
    |> put_flash(:info, "User device deleted successfully.")
    |> redirect(to: ~p"/user_devices")
  end
end
