Category::HABTM_MenuItems.create!([
  {category_id: 2, menu_item_id: 64},
  {category_id: 3, menu_item_id: 64},
  {category_id: 2, menu_item_id: 65},
  {category_id: 3, menu_item_id: 65},
  {category_id: 2, menu_item_id: 66},
  {category_id: 3, menu_item_id: 66},
  {category_id: 2, menu_item_id: 67},
  {category_id: 3, menu_item_id: 67},
  {category_id: 2, menu_item_id: 68},
  {category_id: 3, menu_item_id: 68},
  {category_id: 7, menu_item_id: 68},
  {category_id: 2, menu_item_id: 69},
  {category_id: 3, menu_item_id: 69},
  {category_id: 1, menu_item_id: 70},
  {category_id: 7, menu_item_id: 71},
  {category_id: 1, menu_item_id: 71},
  {category_id: 6, menu_item_id: 72},
  {category_id: 5, menu_item_id: 73},
  {category_id: 7, menu_item_id: 73},
  {category_id: 2, menu_item_id: 74},
  {category_id: 3, menu_item_id: 74},
  {category_id: 6, menu_item_id: 75},
  {category_id: 4, menu_item_id: 75},
  {category_id: 6, menu_item_id: 76},
  {category_id: 4, menu_item_id: 77},
  {category_id: 7, menu_item_id: 78}
])
MenuItem::HABTM_Categories.create!([
  {category_id: 2, menu_item_id: 64},
  {category_id: 3, menu_item_id: 64},
  {category_id: 2, menu_item_id: 65},
  {category_id: 3, menu_item_id: 65},
  {category_id: 2, menu_item_id: 66},
  {category_id: 3, menu_item_id: 66},
  {category_id: 2, menu_item_id: 67},
  {category_id: 3, menu_item_id: 67},
  {category_id: 2, menu_item_id: 68},
  {category_id: 3, menu_item_id: 68},
  {category_id: 7, menu_item_id: 68},
  {category_id: 2, menu_item_id: 69},
  {category_id: 3, menu_item_id: 69},
  {category_id: 1, menu_item_id: 70},
  {category_id: 7, menu_item_id: 71},
  {category_id: 1, menu_item_id: 71},
  {category_id: 6, menu_item_id: 72},
  {category_id: 5, menu_item_id: 73},
  {category_id: 7, menu_item_id: 73},
  {category_id: 2, menu_item_id: 74},
  {category_id: 3, menu_item_id: 74},
  {category_id: 6, menu_item_id: 75},
  {category_id: 4, menu_item_id: 75},
  {category_id: 6, menu_item_id: 76},
  {category_id: 4, menu_item_id: 77},
  {category_id: 7, menu_item_id: 78}
])
CartedMenuItem.create!([
  {user_id: 1, menu_item_id: 76, quantity: 2, status: "purchased", order_id: 13},
  {user_id: 1, menu_item_id: 65, quantity: 2, status: "purchased", order_id: 13},
  {user_id: 1, menu_item_id: 73, quantity: 2, status: "purchased", order_id: 13},
  {user_id: 1, menu_item_id: 74, quantity: 3, status: "purchased", order_id: 14},
  {user_id: 1, menu_item_id: 66, quantity: 3, status: "purchased", order_id: 14},
  {user_id: 1, menu_item_id: 73, quantity: 3, status: "purchased", order_id: 14}
])
Category.create!([
  {name: "Appetizer"},
  {name: "Lunch"},
  {name: "Drink"},
  {name: "Dinner"},
  {name: "Side"},
  {name: "Dessert"},
  {name: "Breakfast"}
])
MenuItem.create!([
  {name: "Hamburger", description: "All-beef patty!", price: "4.55", avatar: "hamburgy.jpg"},
  {name: "Cheeseburger", description: "Burger with your choice of cheese.", price: "4.95", avatar: "hamburger.jpg"},
  {name: "Hot Dog", description: "All-beef franks!", price: "2.25", avatar: "hot_dog.jpg"},
  {name: "Chicken Sandwich", description: "Grilled chicken breast.", price: "4.95", avatar: "chick_sand.jpg"},
  {name: "Chicken Nuggets", description: "Deep fried chicken pieces!", price: "3.65", avatar: "chick_nugs.jpg"},
  {name: "Fish Sandwich", description: "Battered cod filet.", price: "3.85", avatar: "fish_sand.jpg"},
  {name: "Breakfast Sandwich", description: "Egg, ham, cheese on a muffin.", price: "3.0", avatar: "breaky_sandwich.jpg"},
  {name: "Hash Browns", description: "Golden fried potatos.", price: "2.35", avatar: "hash_browns.jpg"},
  {name: "Coffee", description: "Drip brewed.", price: "1.25", avatar: "coffee.png"},
  {name: "Sweet Potato Fries", description: "Fried sweet potatoes.", price: "2.85", avatar: "sweet_fries.jpg"},
  {name: "Italian Sausage", description: "Italian sausage with peppers.", price: "3.55", avatar: "italian.jpg"},
  {name: "Milkshake", description: "Vanilla, strawberry, or chocolate.", price: "1.75", avatar: "milkshake.jpg"},
  {name: "Pop", description: "Popsi products available.", price: "1.25", avatar: "pop.png"},
  {name: "Funnel Cake", description: "Fried dough with sugar.", price: "2.35", avatar: "funnel_cake.jpg"},
  {name: "Onion Rings", description: "Fried onion rings.", price: "3.15", avatar: "onion_rings.jpg"}
])
Order.create!([
  {user_id: 1, subtotal: "18.1", tax: "1.63", total: "19.73"},
  {user_id: 1, subtotal: "25.95", tax: "2.34", total: "28.29"}
])
User.create!([
  {name: "test_user", email: "user@test.com", password_digest: "$2a$10$YKlsRopyGP7NLXFK4SoC9eeMhKSTeU0d9RffvsOBicgYNCdMsPepK", admin: false},
  {name: "admin_user", email: "admin@test.com", password_digest: "$2a$10$zm9kZ41ToqEqXwzoRoRJTuuidTctD/XoT5UiaOVZfVb6Sx/5lEaTu", admin: true}
])
