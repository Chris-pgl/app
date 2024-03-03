defmodule App1.Device do
  @moduledoc """
  The Device context.
  """

  import Ecto.Query, warn: false

  alias App1.Repo



  alias App1.Device.UserDevice

  @doc """
  Returns the list of user_devices.

  ## Examples

      iex> list_user_devices()
      [%UserDevice{}, ...]

  """
  def list_user_devices do
    Repo.all(UserDevice)
  end

  @doc """
  Gets a single user_device.

  Raises `Ecto.NoResultsError` if the User device does not exist.

  ## Examples

      iex> get_user_device!(123)
      %UserDevice{}

      iex> get_user_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_device!(id), do: Repo.get!(UserDevice, id)

  @doc """
  Creates a user_device.

  ## Examples

      iex> create_user_device(%{field: value})
      {:ok, %UserDevice{}}

      iex> create_user_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_device(attrs \\ %{}) do
    %UserDevice{}
    |> UserDevice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_device.

  ## Examples

      iex> update_user_device(user_device, %{field: new_value})
      {:ok, %UserDevice{}}

      iex> update_user_device(user_device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_device(%UserDevice{} = user_device, attrs) do
    user_device
    |> UserDevice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_device.

  ## Examples

      iex> delete_user_device(user_device)
      {:ok, %UserDevice{}}

      iex> delete_user_device(user_device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_device(%UserDevice{} = user_device) do
    Repo.delete(user_device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_device changes.

  ## Examples

      iex> change_user_device(user_device)
      %Ecto.Changeset{data: %UserDevice{}}

  """
  def change_user_device(%UserDevice{} = user_device, attrs \\ %{}) do
    UserDevice.changeset(user_device, attrs)
  end

  # def create_user_device(user_id, attrs \\ %{}) do
  #   %UserDevice{}
  #   |> UserDevice.changeset(Map.put(attrs, :user_id, user_id))
  #   |> Repo.insert()
  # end
end
