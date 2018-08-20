require 'test_helper'

class AttractionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attractions_index_url
    assert_response :success
  end

  test "should get show" do
    get attractions_show_url
    assert_response :success
  end

  test "should get create" do
    get attractions_create_url
    assert_response :success
  end

  test "should get new" do
    get attractions_new_url
    assert_response :success
  end

  test "should get edit" do
    get attractions_edit_url
    assert_response :success
  end

  test "should get update" do
    get attractions_update_url
    assert_response :success
  end

end
