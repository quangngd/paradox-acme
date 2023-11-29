defmodule AcmeWeb.ProductControllerTest do
  use AcmeWeb.ConnCase

  import Acme.ProductsFixtures

  alias Acme.Products.Product

  @create_attrs %{
    category: "some category",
    description: "some description",
    name: "some name",
    quantity: 42,
    unit_cost: 42
  }
  @update_attrs %{
    category: "some updated category",
    description: "some updated description",
    name: "some updated name",
    quantity: 43,
    unit_cost: 43
  }
  @invalid_attrs %{category: nil, description: nil, name: nil, quantity: nil, unit_cost: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "category" => "some category",
               "description" => "some description",
               "name" => "some name",
               "quantity" => 42,
               "unit_cost" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "category" => "some updated category",
               "description" => "some updated description",
               "name" => "some updated name",
               "quantity" => 43,
               "unit_cost" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  describe "total inventory cost" do
    setup [:create_product]

    test "renders inventory cost", %{conn: conn, product: %Product{id: id} = _product} do
      conn = get(conn, Routes.product_path(conn, :total_inventory_cost, id))

      assert %{
               "id" => ^id,
               "category" => "some category",
               "unit_cost" => 42,
               "description" => "some description",
               "name" => "some name",
               "quantity" => 42,
               "total_inventory_cost" => 1764
             } = json_response(conn, 200)["data"]
    end
  end

  defp create_product(_) do
    product = product_fixture()
    %{product: product}
  end
end
