module SummonersHelper

	def summoner_name
		if @summoner
			@summoner.name
		else
			"Unable to find any summoners"
		end
	end

	def summoner_game
		if @summoner.in_game?
			"Displaying ingame details"
		else
			"#{summoner_name} is not currently in game"
		end
	end
end
