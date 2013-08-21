require 'test_helper'

class GameboardsControllerTest < ActionController::TestCase
  setup do
    @gameboard = gameboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gameboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameboard" do
    assert_difference('Gameboard.count') do
      post :create, gameboard: { game_round_id: @gameboard.game_round_id, goal: @gameboard.goal, gridsize: @gameboard.gridsize, player1_start_position: @gameboard.player1_start_position, player2_start_position: @gameboard.player2_start_position }
    end

    assert_redirected_to gameboard_path(assigns(:gameboard))
  end

  test "should show gameboard" do
    get :show, id: @gameboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameboard
    assert_response :success
  end

  test "should update gameboard" do
    put :update, id: @gameboard, gameboard: { game_round_id: @gameboard.game_round_id, goal: @gameboard.goal, gridsize: @gameboard.gridsize, player1_start_position: @gameboard.player1_start_position, player2_start_position: @gameboard.player2_start_position }
    assert_redirected_to gameboard_path(assigns(:gameboard))
  end

  test "should destroy gameboard" do
    assert_difference('Gameboard.count', -1) do
      delete :destroy, id: @gameboard
    end

    assert_redirected_to gameboards_path
  end
end
