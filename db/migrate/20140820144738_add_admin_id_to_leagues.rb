class AddAdminIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :admin_id, :int
  end
end
