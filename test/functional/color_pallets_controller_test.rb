require 'test_helper'

class ColorPalletsControllerTest < ActionController::TestCase
  setup do
    @color_pallet = color_pallets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:color_pallets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create color_pallet" do
    assert_difference('ColorPallet.count') do
      post :create, color_pallet: { color: @color_pallet.color }
    end

    assert_redirected_to color_pallet_path(assigns(:color_pallet))
  end

  test "should show color_pallet" do
    get :show, id: @color_pallet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @color_pallet
    assert_response :success
  end

  test "should update color_pallet" do
    put :update, id: @color_pallet, color_pallet: { color: @color_pallet.color }
    assert_redirected_to color_pallet_path(assigns(:color_pallet))
  end

  test "should destroy color_pallet" do
    assert_difference('ColorPallet.count', -1) do
      delete :destroy, id: @color_pallet
    end

    assert_redirected_to color_pallets_path
  end
end
