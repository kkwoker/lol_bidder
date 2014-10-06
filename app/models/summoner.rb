class Summoner < ActiveRecord::Base
	API_KEY = ENV["MYAPP_LEAGUE_OF_LEGENDS_API_KEY"]

	has_many :bids

	# scope :search, -> (query){ where("name like ?", "#{query}")}

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

	private

	def get_summoner_object
		endpoint = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{name_without_spaces(name)}?api_key=#{API_KEY}"
		uri = URI(endpoint)
		begin
			string = Net::HTTP.get(uri)
			object = JSON.parse(string)
			self.id = object[name_without_spaces(name).downcase]["id"]
			self.profileIconId = object[name_without_spaces(name).downcase]["profileIconId"]
			self.summonerLevel = object[name_without_spaces(name).downcase]["summonerLevel"]
		rescue 
			puts "Something in the API went wrong"
			return false
		end
	end

	def name_without_spaces(name)
		name.gsub(/ /, '')
	end
end
