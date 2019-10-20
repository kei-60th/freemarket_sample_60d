class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|

      t.integer :curd_number,         null: false
      t.integer :valid_year,          null: false
      t.integer :valid_month,         null: false
      t.integer :cvc,                 null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
