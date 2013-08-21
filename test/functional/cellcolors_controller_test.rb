require 'test_helper'

class CellcolorsControllerTest < ActionController::TestCase
  setup do
    @cellcolor = cellcolors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cellcolors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cellcolor" do
    assert_difference('Cellcolor.count') do
      post :create, cellcolor: { cellnumber: @cellcolor.cellnumber, color_pallet_id: @cellcolor.color_pallet_id, gameboard_id: @cellcolor.gameboard_id }
    end

    assert_redirected_to cellcolor_path(assigns(:cellcolor))
  end

  test "should show cellcolor" do
    get :show, id: @cellcolor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cellcolor
    assert_response :success
  end

  test "should update cellcolor" do
    put :update, id: @cellcolor, cellcolor: { cellnumber: @cellcolor.cellnumber, color_pallet_id: @cellcolor.color_pallet_id, gameboard_id: @cellcolor.gameboard_id }
    assert_redirected_to cellcolor_path(assigns(:cellcolor))
  end

  test "should destroy cellcolor" do
    assert_difference('Cellcolor.count', -1) do
      delete :destroy, id: @cellcolor
    end

    assert_redirected_to cellcolors_path
  end
end
