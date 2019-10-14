class CreateDeliveryDates < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_dates do |t|
      t.string :date
      t.references :item, null:false, foreign_key:true
      t.timestamps
    end
  end
end
