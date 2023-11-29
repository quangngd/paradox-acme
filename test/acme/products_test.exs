defmodule Acme.ProductsTest do
  use Acme.DataCase

  alias Acme.Products

  describe "products" do
    alias Acme.Products.Product

    import Acme.ProductsFixtures

    @invalid_attrs %{category: nil, description: nil, name: nil, quantity: nil, unit_cost: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{
        category: "some category",
        description: "some description",
        name: "some name",
        quantity: 42,
        unit_cost: 42
      }

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.category == "some category"
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.quantity == 42
      assert product.unit_cost == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()

      update_attrs = %{
        category: "some updated category",
        description: "some updated description",
        name: "some updated name",
        quantity: 43,
        unit_cost: 43
      }

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.category == "some updated category"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.quantity == 43
      assert product.unit_cost == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
