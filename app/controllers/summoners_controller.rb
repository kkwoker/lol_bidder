class SummonersController < ApplicationController

	def show
		@summoners = Summoner.search(params[:name])
	end	
end
