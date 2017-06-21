class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_menu_items
  has_many :menu_items, through: :carted_menu_items

  def update_all_totals
    subtotal = 0
    carted_menu_items.each do |carted_menu_item|
      subtotal += carted_menu_item.subtotal
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end
