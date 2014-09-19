class League < ActiveRecord::Base
	
	belongs_to :admin, class_name: "User", foreign_key: "admin_id"
	has_many :league_users
	has_many :users, through: :league_users

	has_many :matches
end
