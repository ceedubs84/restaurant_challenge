FactoryGirl.define do
  factory :category do
    name Faker::Commerce.department(1, true)
  end

  factory :menu_item do
    name Faker::Food.ingredient
    description Faker::Lorem.unique.sentence
    price Faker::Commerce.price

    factory :menu_item_with_categories do
      transient do
        categories_count 2
      end
      after(:create) do |menu_item, evaluator|
        create_list(:category, evaluator.categories_count, menu_items: [menu_item])
      end
    end
  end
end
