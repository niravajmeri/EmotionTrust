require 'test_helper'

class TransferResourcesControllerTest < ActionController::TestCase
  setup do
    @transfer_resource = transfer_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transfer_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transfer_resource" do
    assert_difference('TransferResource.count') do
      post :create, transfer_resource: { color_pallet_id: @transfer_resource.color_pallet_id, game_round_id: @transfer_resource.game_round_id, opponent_id: @transfer_resource.opponent_id, player_id: @transfer_resource.player_id, quantity: @transfer_resource.quantity }
    end

    assert_redirected_to transfer_resource_path(assigns(:transfer_resource))
  end

  test "should show transfer_resource" do
    get :show, id: @transfer_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transfer_resource
    assert_response :success
  end

  test "should update transfer_resource" do
    put :update, id: @transfer_resource, transfer_resource: { color_pallet_id: @transfer_resource.color_pallet_id, game_round_id: @transfer_resource.game_round_id, opponent_id: @transfer_resource.opponent_id, player_id: @transfer_resource.player_id, quantity: @transfer_resource.quantity }
    assert_redirected_to transfer_resource_path(assigns(:transfer_resource))
  end

  test "should destroy transfer_resource" do
    assert_difference('TransferResource.count', -1) do
      delete :destroy, id: @transfer_resource
    end

    assert_redirected_to transfer_resources_path
  end
end
