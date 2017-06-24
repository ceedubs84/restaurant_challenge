class Category < ApplicationRecord
  has_many :menu_item_categories
  has_many :menu_items, through: :menu_item_categories
end
