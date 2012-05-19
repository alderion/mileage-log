require 'test_helper'

class ServiceItemsControllerTest < ActionController::TestCase
  setup do
    @service_item = service_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_item" do
    assert_difference('ServiceItem.count') do
      post :create, service_item: { completed: @service_item.completed, item_desc: @service_item.item_desc, odometer: @service_item.odometer }
    end

    assert_redirected_to service_item_path(assigns(:service_item))
  end

  test "should show service_item" do
    get :show, id: @service_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_item
    assert_response :success
  end

  test "should update service_item" do
    put :update, id: @service_item, service_item: { completed: @service_item.completed, item_desc: @service_item.item_desc, odometer: @service_item.odometer }
    assert_redirected_to service_item_path(assigns(:service_item))
  end

  test "should destroy service_item" do
    assert_difference('ServiceItem.count', -1) do
      delete :destroy, id: @service_item
    end

    assert_redirected_to service_items_path
  end
end
