class Category < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :size_category
  has_many :sizes, through: :size_category
end
