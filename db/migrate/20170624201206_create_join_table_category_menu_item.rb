class CreateJoinTableCategoryMenuItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :menu_items do |t|
      # t.index [:category_id, :menu_item_id]
      # t.index [:menu_item_id, :category_id]
    end
  end
end
