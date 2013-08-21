require 'test_helper'

class PlayerCommunicationsControllerTest < ActionController::TestCase
  setup do
    @player_communication = player_communications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_communications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_communication" do
    assert_difference('PlayerCommunication.count') do
      post :create, player_communication: { game_round_id: @player_communication.game_round_id, player_id: @player_communication.player_id }
    end

    assert_redirected_to player_communication_path(assigns(:player_communication))
  end

  test "should show player_communication" do
    get :show, id: @player_communication
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_communication
    assert_response :success
  end

  test "should update player_communication" do
    put :update, id: @player_communication, player_communication: { game_round_id: @player_communication.game_round_id, player_id: @player_communication.player_id }
    assert_redirected_to player_communication_path(assigns(:player_communication))
  end

  test "should destroy player_communication" do
    assert_difference('PlayerCommunication.count', -1) do
      delete :destroy, id: @player_communication
    end

    assert_redirected_to player_communications_path
  end
end
