require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:pragprog)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count", 1) do
      post products_url, params: {
        product: {
          title: "Some title #{SecureRandom.hex(4)}",
          description: "Some description",
          price: 9.99,
          image: fixture_file_upload("lorem.jpg", "image/jpeg")
        }
      }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: {
      product: {
        title: "Updated title #{SecureRandom.hex(4)}",
        description: "Updated description",
        price: 29.99,
        image: fixture_file_upload("lorem.jpg", "image/jpeg")
      }
    }

    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
