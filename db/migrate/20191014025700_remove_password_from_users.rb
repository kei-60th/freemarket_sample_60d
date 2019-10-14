class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password, :string
    t.string :encrypted_password,            null: false, unique: true
  end
end
