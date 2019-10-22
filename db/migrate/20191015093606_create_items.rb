class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name,               null: false
      t.integer      :price,              null: false
      t.text         :description,        null: false
      # t.integer   :brand,              null: false
      # t.integer   :order_status_id,     null: false
      t.integer  :address_id,         null: false
      t.integer  :category_id,         null: false, index: true  
      t.integer   :prefecture_id,       null: false  
      # t.integer   :size_id,             null: false, index: true  
      t.integer   :condition_id,        null: false  
      t.integer   :delivery_fee_id,     null: false  
      t.integer   :delivery_way_id,     null: false  
      t.integer   :delivery_date_id,    null: false  
      t.references   :user,          null: false
      t.timestamps 
    end
  end
end