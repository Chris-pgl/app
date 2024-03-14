defmodule App1Web.CarHTML do
  use App1Web, :html

  embed_templates "car_html/*"

  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def car_form(assigns)
end
