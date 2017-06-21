require 'test_helper'

class CartedMenuItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carted_menu_items_index_url
    assert_response :success
  end

end
