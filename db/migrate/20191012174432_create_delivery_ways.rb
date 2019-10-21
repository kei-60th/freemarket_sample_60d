class CreateDeliveryWays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_ways do |t|
      t.string :way, null: false
      # t.references :item, null:false, foreign_key:true
      t.timestamps
    end
  end
end
