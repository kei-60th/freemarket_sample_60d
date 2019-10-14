class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :password,           :string
  end

  def change
    add_column    :users, :encrypted_password, :string, null: false, unique: true
  end
end
