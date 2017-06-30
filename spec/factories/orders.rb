FactoryGirl.define do
  factory :carted_menu_item do
    user
    menu_item
    quantity 5
    status 'purchased'
  end

  factory :order do
    user

    factory :order_with_carted_menu_items do
      transient do
        carted_menu_items_count 2
      end
      after(:create) do |order, evaluator|
        create_list(:carted_menu_item, evaluator.carted_menu_items_count, order: order)
      end
    end
  end
end
