defmodule App1Web.UserHTML do
  use App1Web, :html

  embed_templates "user_html/*"

  @doc """
  Renders a user form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :countries, :string, required: true

  def user_form(assigns)

  def pippo_html(assigns) do
    ~H"""
    <h1>pippo</h1>
    """
  end
end
