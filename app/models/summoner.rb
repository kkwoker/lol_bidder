class Summoner < ActiveRecord::Base
	API_KEY = ENV["MYAPP_LEAGUE_OF_LEGENDS_API_KEY"]
	MASHAPE_KEY = ENV["MYAPP_LOL_MASHAPE_API_KEY"]
	has_many :bids

	before_save :get_summoner_object

	def bid(team, wager, match)
		new_bid = Bid.new(summoner_id: id,
			team: team,
			wager: wager,
			match_id: match.id
			)
		new_bid.save

	end

	def self.search(query)
		# Note: unable to use scope because they always return ActiveRecord Relations even when nil. 
		self.where("name like ?", "#{query}")
	end

	def in_game?
		live_game = Unirest.get "https://community-league-of-legends.p.mashape.com/api/v1.0/NA/summoner/retrieveInProgressSpectatorGameInfo/#{name_without_spaces(name)}", headers:{ :X_Mashape_Key => "#{MASHAPE_KEY}"}
		if live_game.body["error"]
			return false
		else
			return true
		end
	end


	private

	def get_summoner_object
		# This method is ran every time a Summoner is searched. . . Everytime a summoner is searched, we instantiate the summoner.
		# We look up the name through the API. If it fails, there will be an exception and the Summoner will not be saved
		endpoint = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{name_without_spaces(name)}?api_key=#{API_KEY}"
		uri = URI(endpoint)
		begin
			string = Net::HTTP.get(uri)
			object = JSON.parse(string)
			self.id = object[name_without_spaces(name).downcase]["id"]
			self.profileIconId = object[name_without_spaces(name).downcase]["profileIconId"]
			self.summonerLevel = object[name_without_spaces(name).downcase]["summonerLevel"]
		rescue 
			puts "Summoner does not exist or something in the API went wrong"
			return false
		end
	end

	def name_without_spaces(name)
		name.gsub(/ /, '')
	end
end
