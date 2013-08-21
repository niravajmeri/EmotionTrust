require 'test_helper'

class GameroundsControllerTest < ActionController::TestCase
  setup do
    @gameround = gamerounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gamerounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gameround" do
    assert_difference('Gameround.count') do
      post :create, gameround: { emotion: @gameround.emotion, game_id: @gameround.game_id, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, player1_emotion: @gameround.player1_emotion, player1_expectation: @gameround.player1_expectation, player1_move: @gameround.player1_move, player2: @gameround.player2, player2_expectation: @gameround.player2_expectation, player2_move: @gameround.player2_move }
    end

    assert_redirected_to gameround_path(assigns(:gameround))
  end

  test "should show gameround" do
    get :show, id: @gameround
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gameround
    assert_response :success
  end

  test "should update gameround" do
    put :update, id: @gameround, gameround: { emotion: @gameround.emotion, game_id: @gameround.game_id, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, integer: @gameround.integer, player1_emotion: @gameround.player1_emotion, player1_expectation: @gameround.player1_expectation, player1_move: @gameround.player1_move, player2: @gameround.player2, player2_expectation: @gameround.player2_expectation, player2_move: @gameround.player2_move }
    assert_redirected_to gameround_path(assigns(:gameround))
  end

  test "should destroy gameround" do
    assert_difference('Gameround.count', -1) do
      delete :destroy, id: @gameround
    end

    assert_redirected_to gamerounds_path
  end
end
