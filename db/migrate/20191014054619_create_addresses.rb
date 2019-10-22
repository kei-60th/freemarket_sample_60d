class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string      :postcode,     null: false
      t.string      :city,         null: false
      t.string      :address,      null: false
      t.string      :building_name
      t.integer     :prefecture_id, null:false
      t.references  :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
