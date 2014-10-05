class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    	t.float :wager
    	t.string :team
    	t.integer :summoner_id
    	t.integer :match_id
      t.timestamps
    end
  end
end
