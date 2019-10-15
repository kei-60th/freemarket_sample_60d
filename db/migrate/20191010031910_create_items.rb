class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.integer    :price,            null: false
      t.text       :description,      null: false
      t.integer    :order_status,     null: false
      t.integer :category,         null: false, index: true, foreign_key: true
      t.integer  :prefecure,        foreign_key: true
      t.integer  :size,             null: false, index: true, foreign_key: true
      # t.integer  :condition,        null: false, foreign_key: true
      # t.integer  :delivery_fee,     null: false, foreign_key: true
      # t.integer  :delivery_way,     null: false, foreign_key: true
      # t.integer  :delivery_date,    null: false, foreign_key: true
      t.references :user,             null: false
      t.timestamps 
    end
  end
end