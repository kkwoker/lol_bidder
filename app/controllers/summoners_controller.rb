class SummonersController < ApplicationController

	before_action :get_all_summoners

	def show
		# #search is a scope
		@summoner = Summoner.search(params[:name])[0]
		# if the summoner is not in our database, do an API call for the summoner
		if !@summoner
			s = Summoner.new(name: params[:name])
			if s.save
				@summoner = s
			else
				@no_summoner_found = true
			end
		end
	end	

	private

	def get_all_summoners
		@summoners = Summoner.all
	end
end
