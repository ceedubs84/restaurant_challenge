10.times do
  MenuItem.create(
    name: Faker::Food.ingredient,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price,
  )
end
menu_item_categories = ['Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Appetizer', 'Drink', 'Side']

menu_item_categories.each do |category|
  Category.create(name: category)
end