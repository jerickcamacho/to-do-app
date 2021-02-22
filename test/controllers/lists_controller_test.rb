require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
  end

  test "1. should get index" do
    get lists_url
    assert_response :success
  end

  test "2. should get new" do
    get new_list_url
    assert_response :success
  end

  test "3. should create list" do
    assert_difference('List.count') do
      post lists_url, params: { list: { completed: @list.completed, description: @list.description } }
    end

    assert_redirected_to list_url(List.last)
  end

  test "4. should show list" do
    get list_url(@list)
    assert_response :success
  end

  test "5. should get edit" do
    get edit_list_url(@list)
    assert_response :success
  end

  test "6. should update list" do
    patch list_url(@list), params: { list: { completed: @list.completed, description: @list.description } }
    assert_redirected_to list_url(@list)
  end

  test "7. should remove list" do
    assert_difference('List.count', -1) do
      delete list_url(@list)
    end

    assert_redirected_to lists_url
  end
end
