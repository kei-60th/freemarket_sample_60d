class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string      :name        , null: false
      t.references  :addresses_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
