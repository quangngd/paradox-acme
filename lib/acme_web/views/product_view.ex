defmodule AcmeWeb.ProductView do
  use AcmeWeb, :view
  alias AcmeWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("show_with_total_inventory_cost.json", %{product: product}) do
    %{data: render_one(product, ProductView, "total_inventory_cost.json")}
  end

  def render("product.json", %{product: product}) do
    make_map_from_product(product, false)
  end

  def render("total_inventory_cost.json", %{product: product}) do
    make_map_from_product(product, true)
  end

  defp make_map_from_product(product, show_total_inventory_cost) do
    map = %{
      id: product.id,
      name: product.name,
      description: product.description,
      category: product.category,
      quantity: product.quantity,
      unit_cost: product.unit_cost
    }

    if show_total_inventory_cost do
      Map.put(map, :total_inventory_cost, product.unit_cost * product.quantity)
    else
      map
    end
  end
end
