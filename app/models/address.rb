class Address < ApplicationRecord
  belongs_to :user
  has_one :prefecture

  validates :postcode, presence: true
  validates :city,     presence: true
  validates :address,  presence: true
  validates :user_id,  presence: true
end
