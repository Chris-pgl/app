defmodule App1Web.UserDeviceHTML do
  use App1Web, :html

  embed_templates "user_device_html/*"

  @doc """
  Renders a user_device form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true


  def user_device_form(assigns)
end
