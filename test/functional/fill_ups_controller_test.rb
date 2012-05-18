require 'test_helper'

class FillUpsControllerTest < ActionController::TestCase
  setup do
    @fill_up = fill_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fill_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fill_up" do
    assert_difference('FillUp.count') do
      post :create, fill_up: { cost_per_gallon: @fill_up.cost_per_gallon, fill_date: @fill_up.fill_date, gallons: @fill_up.gallons, mileage: @fill_up.mileage, total_cost: @fill_up.total_cost }
    end

    assert_redirected_to fill_up_path(assigns(:fill_up))
  end

  test "should show fill_up" do
    get :show, id: @fill_up
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fill_up
    assert_response :success
  end

  test "should update fill_up" do
    put :update, id: @fill_up, fill_up: { cost_per_gallon: @fill_up.cost_per_gallon, fill_date: @fill_up.fill_date, gallons: @fill_up.gallons, mileage: @fill_up.mileage, total_cost: @fill_up.total_cost }
    assert_redirected_to fill_up_path(assigns(:fill_up))
  end

  test "should destroy fill_up" do
    assert_difference('FillUp.count', -1) do
      delete :destroy, id: @fill_up
    end

    assert_redirected_to fill_ups_path
  end
end
