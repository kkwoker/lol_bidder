class SummonersController < ApplicationController

	def show
		# #search is a scope
		@summoner = Summoner.search(params[:name])[0]
		# if the summoner is not in our database, do an API call for the summoner
		if !@summoner
			s = Summoner.find_or_initialize_by(name: params[:name])
			if s.save
				@summoner = s
			end
		end

	end	
end
