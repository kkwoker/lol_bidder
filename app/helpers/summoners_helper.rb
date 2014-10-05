module SummonersHelper

	def summoner_name
		if @summoner
			@summoner.name
		else
			"Unable to find any summoners"
		end
	end
end
