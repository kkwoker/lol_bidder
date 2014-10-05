class Summoner < ActiveRecord::Base
	has_many :bids

	def bid(team, wager, match)
		new_bid = Bid.new(summoner_id: id,
			team: team,
			wager: wager,
			match_id: match.id
			)
		new_bid.save

	end
end
