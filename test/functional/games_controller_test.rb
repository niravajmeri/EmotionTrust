require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { player1_end_mood: @game.player1_end_mood, player1_id: @game.player1_id, player1_player2_end_trust: @game.player1_player2_end_trust, player1_player2_start_trust: @game.player1_player2_start_trust, player1_start_mood: @game.player1_start_mood, player2_end_mood: @game.player2_end_mood, player2_id: @game.player2_id, player2_player1_end_trust: @game.player2_player1_end_trust, player2_player1_start_trust: @game.player2_player1_start_trust, player2_start_mood: @game.player2_start_mood }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    put :update, id: @game, game: { player1_end_mood: @game.player1_end_mood, player1_id: @game.player1_id, player1_player2_end_trust: @game.player1_player2_end_trust, player1_player2_start_trust: @game.player1_player2_start_trust, player1_start_mood: @game.player1_start_mood, player2_end_mood: @game.player2_end_mood, player2_id: @game.player2_id, player2_player1_end_trust: @game.player2_player1_end_trust, player2_player1_start_trust: @game.player2_player1_start_trust, player2_start_mood: @game.player2_start_mood }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
