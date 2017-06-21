class MenuItem < ApplicationRecord
  has_many :carted_menu_items
  has_many :orders, through: :carted_menu_items
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, uniqueness: true

  validates :price, numericality: { greater_than: 0 }

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end
end
