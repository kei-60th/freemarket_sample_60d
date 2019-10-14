class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password,           :string
    add_column    :users, :encrypted_password, :string, null: false, unique: true
  end
end
