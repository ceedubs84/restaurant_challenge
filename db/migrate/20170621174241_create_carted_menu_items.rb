class CreateCartedMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :carted_menu_items do |t|
      t.integer :user_id
      t.integer :menu_item_id
      t.integer :quantity
      t.string :status
      t.integer :order_id

      t.timestamps
    end
  end
end
