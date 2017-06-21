class User < ApplicationRecord
  has_secure_password

  has_many :carted_menu_items
end
