require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe 'validations' do
    it 'has a valid MenuItem factory' do
      expect(FactoryGirl.build(:menu_item_with_categories)).to be_valid
    end

    it 'is invalid if menu item already exists with the same name' do
      mi1 = create(:menu_item, name: 'Candy Bar', price: 3.0)
      mi2 = build(:menu_item, name: 'Candy Bar', price: 2.0)
      expect(mi2).to_not be_valid
    end
  end

  describe '#tax' do
    it 'returns the tax of the menu item' do
      menu_item = build(:menu_item_with_categories, price: 10.0)
      expect(menu_item.tax.to_f).to eq(0.9)
    end
  end

  describe '#total' do
    it 'returns the total of the price of the menu item plus the tax' do
      menu_item = build(:menu_item_with_categories, price: 10.0)
      expect(menu_item.total).to eq(10.9)
    end
  end
end
