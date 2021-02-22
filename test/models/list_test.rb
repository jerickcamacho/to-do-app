require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "1. should not save List without name" do
    list = List.new
    list.description = "Masaya ako! naeenjoy ko ang project natoh! Hooray!!"
    assert_not lists.save, 'Saved List without name'
  end

  test "2. should not save List without description" do
    list = List.new
    list.completed = "Im so happy!"
    assert_not list.save, 'Saved List without description'
  end
end
