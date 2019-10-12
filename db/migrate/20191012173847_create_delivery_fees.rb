class CreateDeliveryFees < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fees do |t|
      t,string :fee
      t,references :item_id, null:false, foreign_key:true
      t.timestamps
    end
  end
end
