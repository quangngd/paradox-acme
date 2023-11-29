defmodule Acme.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Acme.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        category: "some category",
        description: "some description",
        name: "some name",
        quantity: 42,
        unit_cost: 42
      })
      |> Acme.Products.create_product()

    product
  end
end
