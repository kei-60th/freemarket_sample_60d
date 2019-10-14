class Address < ApplicationRecord
  belongs_to :user
  has_one :prefecture

  validates :postcode, null: false
  validates :city,     null: false
  validates :address,  null: false
  validates :user_id,  null: false
end
