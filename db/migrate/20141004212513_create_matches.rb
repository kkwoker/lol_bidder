class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.boolean :live , default: true
    	t.float :purple_pool, default: 0.00
    	t.float :blue_pool, default: 0.00
      t.timestamps
    end
  end
end
