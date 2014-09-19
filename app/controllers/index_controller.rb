class IndexController < ApplicationController

	def index 
		@users = User.all
		@leagues = current_user.leagues
	end

end