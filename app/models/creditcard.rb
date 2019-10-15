class Creditcard < ApplicationRecord
  belongs_to :user

  validates :curd_number, presence: true
  validates :valid_year,     presence: true
  validates :valid_month,  presence: true
  validates :cvc,  presence: true
end
