FactoryGirl.define do
  factory :carted_menu_item do
    user
    menu_item
    quantity 5
    status 'carted'
  end
end
