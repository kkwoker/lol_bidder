class AddDataToMatches < ActiveRecord::Migration
  def change
  	create_table :matches_summoners do |t|
  		t.integer :match_id
  		t.integer :summoner_id

  	end
  	add_column :matches, :winner, :string
  end
end
