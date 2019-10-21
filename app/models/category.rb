class Category < ApplicationRecord
  has_one :item
  has_ancestry
  has_many :size_category
  has_many :sizes, through: :size_category
end
