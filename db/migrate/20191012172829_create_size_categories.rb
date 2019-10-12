class CreateSizeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :size_categories do |t|
      t.references :size_ia, null: false, foreign_key: true
      t.references :category_id, null: false, foreign_key: true
    end
  end
end
