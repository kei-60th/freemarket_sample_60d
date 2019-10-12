class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category"
  has_many :items
  has_many :child, class_name: "Category"
  has_many :size_category
  has_many :sizes, through: :size_category
end
