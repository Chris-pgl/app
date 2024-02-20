defmodule App1.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :address, :string
      add :phone, :string
      add :email, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:users, [:country_id])
  end
end
