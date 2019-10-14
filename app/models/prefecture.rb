class Prefecture < ApplicationRecord
  belongs_to :address

  validates :name,         null: false
  validates :addresses_id, null: false
  validates :addresses_id, foreign_key: true
end
