class Bid < ActiveRecord::Base
	belongs_to :summoner
	belongs_to :match

	validates :match, presence: true
	validates :summoner, presence: true

	after_create :add_wager_to_pool

	def add_wager_to_pool
		case team
		when "Purple"
			match.purple_pool += wager
			match.save!
		when "Blue"
			match.blue_pool += wager
			match.save!
		end
 	end

end
