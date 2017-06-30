require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a valid Order factory' do
    expect(FactoryGirl.build(:order)).to be_valid
  end

  describe '#update_all_totals' do
    it 'returns the total cost of all carted items in order' do
      menu_item = create(:menu_item, price: 5)
      carted_menu_item = build(:carted_menu_item, menu_item_id: menu_item.id, quantity: 10)
      subtotal = carted_menu_item.subtotal
      tax = subtotal * 0.09
      total = subtotal + tax
      expect(total).to eq(subtotal + tax)
    end
  end
end
