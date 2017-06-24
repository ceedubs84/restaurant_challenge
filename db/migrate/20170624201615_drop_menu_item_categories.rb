class DropMenuItemCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :menu_item_categories
  end
end
