# frozen_string_literal: true
class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,               presence: true, unique: true
      t.string :encrypted_password,            presence: true, unique: true
      t.string :nickname,            presence: true, unique: true
      t.string :first_name,          presence: true
      t.string :last_name,           presence: true
      t.string :first_name_kana,     presence: true
      t.string :last_name_kana,      presence: true
      t.integer :birth_year,         presence: true
      t.integer :birth_month,        presence: true
      t.integer :birth_day,          presence: true
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      # t.integer  :sign_in_count, default: 0, presence: true
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
      ## Lockable
      # t.integer  :failed_attempts, default: 0, presence: true # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      t.timestamps presence: true
    end
    add_index :users, :email,                 unique: true
    #add_index :users, :email,                 presence: true
    add_index :users, :reset_password_token,  unique: true
    #add_index :users, :reset_password_token,  presence: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end