class AddGameStatusToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_status, :boolean
  end
end
