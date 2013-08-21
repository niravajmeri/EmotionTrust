class AddNumberOfRoundsToGames < ActiveRecord::Migration
  def change
    add_column :games, :number_of_rounds, :integer
  end
end
