class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.integer    :price,            null: false
      t.text       :description,      null: false
      t.integer    :order_status,     null: false
      t.references :category,         null: false, index: true, foreign_key: true
      t.references :prefecure,        foreign_key: true
      t.references :size,             null: false, index: true, foreign_key: true
      t.references :condition,        null: false, foreign_key: true
      t.references :delivery_fee,     null: false, foreign_key: true
      t.references :delivery_way,     null: false, foreign_key: true
      t.references :delivery_date,    null: false, foreign_key: true
      t.references :user,             null: false
      t.timestamp 
    end
  end
end