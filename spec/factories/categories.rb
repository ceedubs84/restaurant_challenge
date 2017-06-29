FactoryGirl.define do
  factory :category do
    name Faker::Commerce.department(1, true)
    menu_item
  end
end
