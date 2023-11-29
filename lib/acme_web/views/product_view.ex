defmodule AcmeWeb.ProductView do
  use AcmeWeb, :view
  alias AcmeWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      category: product.category,
      quantity: product.quantity,
      unit_cost: product.unit_cost
    }
  end
end
