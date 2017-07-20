class DropMenuItemCategories < ActiveRecord::Migration[5.0]
  def down
    drop_table :menu_item_categories
  end
end
