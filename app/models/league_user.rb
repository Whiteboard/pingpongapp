class LeagueUser < ActiveRecord::Base
	belongs_to :user
	belongs_to :league
	# validates_uniqueness_of :user_id
	# validates_uniqueness_of :league_id
	before_save :validate_unique_membership

	def validate_unique_membership
		u = User.find(self.user_id)
		if u.leagues.where(:id => self.league_id).count > 0
			u.errors.add(:base, "Already a part of this league")
			return false
		end
	end
end
