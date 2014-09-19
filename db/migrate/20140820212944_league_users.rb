class LeagueUsers < ActiveRecord::Migration
  def change
  	create_table :league_user do |l|
  		l.references :league
  		l.references :user

  		l.timestamps
  	end
  end
end
