class CartedMenuItem < ApplicationRecord
  belongs_to :user
  belongs_to :menu_item

  validates :quantity, presence: true
  validates :quantity, numericality: true

  def subtotal
    quantity * product.price
  end
end
