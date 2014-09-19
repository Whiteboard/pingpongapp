class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :league_name
      t.string :league_id
      t.string :league_password

      t.timestamps
    end
  end
end
