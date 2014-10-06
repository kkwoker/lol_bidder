class WelcomeController < ApplicationController

	def index
		@summoners = Summoner.all
	end
end
