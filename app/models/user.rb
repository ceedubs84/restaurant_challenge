class User < ApplicationRecord
  has_secure_password
  has_many :carted_menu_items
  has_many :orders

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
end
