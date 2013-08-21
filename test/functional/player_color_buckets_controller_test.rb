require 'test_helper'

class PlayerColorBucketsControllerTest < ActionController::TestCase
  setup do
    @player_color_bucket = player_color_buckets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_color_buckets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_color_bucket" do
    assert_difference('PlayerColorBucket.count') do
      post :create, player_color_bucket: { color_pallet_id: @player_color_bucket.color_pallet_id, game_round_id: @player_color_bucket.game_round_id, player_id: @player_color_bucket.player_id }
    end

    assert_redirected_to player_color_bucket_path(assigns(:player_color_bucket))
  end

  test "should show player_color_bucket" do
    get :show, id: @player_color_bucket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_color_bucket
    assert_response :success
  end

  test "should update player_color_bucket" do
    put :update, id: @player_color_bucket, player_color_bucket: { color_pallet_id: @player_color_bucket.color_pallet_id, game_round_id: @player_color_bucket.game_round_id, player_id: @player_color_bucket.player_id }
    assert_redirected_to player_color_bucket_path(assigns(:player_color_bucket))
  end

  test "should destroy player_color_bucket" do
    assert_difference('PlayerColorBucket.count', -1) do
      delete :destroy, id: @player_color_bucket
    end

    assert_redirected_to player_color_buckets_path
  end
end
