defmodule App1Web.CountryHTML do
  use App1Web, :html

  embed_templates "country_html/*"

  @doc """
  Renders a country form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def country_form(assigns)
end
