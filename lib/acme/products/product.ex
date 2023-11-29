defmodule Acme.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :category, :string
    field :description, :string
    field :name, :string
    field :quantity, :integer
    field :unit_cost, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :category, :quantity, :unit_cost])
    |> validate_required([:name, :description, :category, :quantity, :unit_cost])
  end
end
