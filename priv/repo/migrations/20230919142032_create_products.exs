defmodule Acme.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :category, :string
      add :quantity, :integer
      add :unit_cost, :integer

      timestamps()
    end
  end
end
