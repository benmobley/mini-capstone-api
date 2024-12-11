require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(name: "Admin", email: "admin@example.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "admin@example.com", password: "password" }
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "test product", price: 1, description: "test description", quantity: "5", supplier_id: Supplier.first.id }
    end

    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "images", "description", "supplier", "quantity"], data.keys
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

  test "is_discounted?" do
    product = Product.new(price: 11)
    assert_equal false, product.is_discounted?

    product = Product.new(price: 1)
    assert_equal true, product.is_discounted?
  end

  test "tax" do
    product = Product.new(price: 100)
    assert_in_delta 9, product.tax
  end

  test "total" do
    product = Product.new(price: 100)
    assert_in_delta 109, product.total
  end
end
