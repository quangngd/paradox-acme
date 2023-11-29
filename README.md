# Acme-Service

# Challenge

The acme-service is a simple service that provides a REST API to manage a list of products. 
The service is written in Elixir, uses the Phoenix framework, and a Postgres database.  In this 
challenge, you will be asked to add a new feature to the service.  The new feature is an endpoint 
that computes the total inventory cost of a product.  The total inventory cost should be calculated 
by simply multiplying the prodcut's unit cost by the quantity.  Below is a sample of the expected 
request/response.

#### Request
```
GET /products/:id/total_inventory_cost
```

#### Response
```
{
    "data": {
        "id": 1,
        "category": "some category",
        "unit_cost": 20,
        "description": "some description",
        "name": "some name",
        "quantity": 10,
        "total_inventory_cost": 200
    }
}
```

## Test

The test below should pass when the feature is implemented correctly.

```
test/acme_web/controllers/product_controller_test.exs:99
```

# Getting Started

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

