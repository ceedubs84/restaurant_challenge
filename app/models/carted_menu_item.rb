class CartedMenuItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item
  belongs_to :order, optional: true

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validates :order, presence: true, allow_nil: true

  def subtotal
    quantity * menu_item.price
  end
end
