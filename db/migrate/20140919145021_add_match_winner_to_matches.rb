class AddMatchWinnerToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :match_winner, :integer
  end
end
