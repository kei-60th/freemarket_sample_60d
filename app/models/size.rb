class Size < ApplicationRecord
  has_many :categories, through: :size_category
  has_many :items
  has_many :size_category
end
