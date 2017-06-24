class Category < ApplicationRecord
  has_many :menu_item_categories
  has_and_belongs_to_many :menu_items
end
