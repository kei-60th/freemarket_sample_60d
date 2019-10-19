class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    create_table :add_fields_to_user do |t|
      t.string :provider
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
