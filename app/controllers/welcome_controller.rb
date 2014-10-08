class WelcomeController < ApplicationController
	before_action :get_all_summoners
	def index
	end

	private
	def get_all_summoners
		@summoners = Summoner.all
	end

end
