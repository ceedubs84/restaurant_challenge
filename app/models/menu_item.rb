class MenuItem < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :carted_menu_items
  has_many :orders, through: :carted_menu_items
  has_many :menu_item_categories
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  validates :price, numericality: { greater_than: 0 }

  def tax
    price * 0.09
  end

  def total
    price.to_f + tax
  end
end
