defmodule App1.Repo.Migrations.CreateSpecies do
  use Ecto.Migration

  def change do
    create table(:species) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
