class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 9, scale: 2

      t.timestamps
    end
  end
end
