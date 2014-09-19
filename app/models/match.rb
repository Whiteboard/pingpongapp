class Match < ActiveRecord::Base
	belongs_to :league
	belongs_to :playerone, class_name: "User", foreign_key: "player_one"
	belongs_to :playertwo, class_name: "User", foreign_key: "player_two"

	has_many :games

	validates :league_id, presence: true

	def p1score
		games.where('player_one_score > player_two_score').count
	end

	def p2score
		games.where('player_one_score < player_two_score').count
	end

	def p1name
		[playerone.first_name, playerone.last_name].join(" ")
	end

	def p2name
		[playertwo.first_name, playertwo.last_name].join(" ")
	end

end
