class AddGameRoundStatusToGameRounds < ActiveRecord::Migration
  def change
    add_column :game_rounds, :game_round_status, :boolean
  end
end
