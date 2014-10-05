class Summoner < ActiveRecord::Base
	API_KEY = ENV["MYAPP_LEAGUE_OF_LEGENDS_API_KEY"]

	has_many :bids

	scope :search, -> (query){  where("name like ?", "%#{query}%")}

	before_save :get_summoner_object

	def bid(team, wager, match)
		new_bid = Bid.new(summoner_id: id,
			team: team,
			wager: wager,
			match_id: match.id
			)
		new_bid.save

	end

	def get_summoner_object
		
		endpoint = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{name}?api_key=#{API_KEY}"
		uri = URI(endpoint)
		begin
			string = Net::HTTP.get(uri)
			object = JSON.parse(string)
			self.id = object[name.downcase]["id"]
			self.profileIconId = object[name.downcase]["profileIconId"]
			self.summonerLevel = object[name.downcase]["summonerLevel"]
		rescue 
			puts "Could not find summoner"
			return false
		end
	end

end
