require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "1. should get index" do
    get categories_index_url
    assert_response :success
  end

  test "2. should get show" do
    get categories_show_url
    assert_response :success
  end

  test "3. should get new" do
    get categories_new_url
    assert_response :success
  end

  test "4. should get edit" do
    get categories_edit_url
    assert_response :success
  end

  test "5. should get create" do
    get categories_create_url
    assert_response :success
  end

  test "6. should get update" do
    get categories_update_url
    assert_response :success
  end

  test "7. should get destroy" do
    get categories_destroy_url
    assert_response :success
  end

end
