class AddObjectToSummoners < ActiveRecord::Migration
  def change
  	add_column :summoners, :profileIconId, :integer
  	add_column :summoners, :summonerLevel, :integer

  end
end
