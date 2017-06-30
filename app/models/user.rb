class User < ApplicationRecord
  has_secure_password
  has_many :carted_menu_items
  has_many :orders

  validates :email, presence: true
  validates :email, uniqueness: true
end
