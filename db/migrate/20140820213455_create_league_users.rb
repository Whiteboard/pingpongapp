class CreateLeagueUsers < ActiveRecord::Migration
  def change
    create_table :league_users do |t|
      t.references :user
      t.references :league

      t.timestamps
    end

    drop_table :league_user
  end
end
