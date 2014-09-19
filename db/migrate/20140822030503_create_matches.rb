class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :player_one
      t.string :player_two

      t.timestamps
    end
  end
end
