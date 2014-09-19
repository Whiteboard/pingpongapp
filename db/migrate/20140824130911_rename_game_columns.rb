class RenameGameColumns < ActiveRecord::Migration
  def change
  	rename_column :games, :home_id, :player_one_id
  	rename_column :games, :home_score, :player_one_score
  	rename_column :games, :away_id, :player_two_id
  	rename_column :games, :away_score, :player_two_score
  end
end
