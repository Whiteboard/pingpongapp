class MatchPlayersToInteger < ActiveRecord::Migration
  def change
  	remove_column :matches, :player_one
  	remove_column :matches, :player_two

  	add_column :matches, :player_one, :integer
  	add_column :matches, :player_two, :integer
  end
end
