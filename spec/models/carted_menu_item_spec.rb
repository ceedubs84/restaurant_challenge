require 'rails_helper'

RSpec.describe CartedMenuItem, type: :model do
  it 'has a valid CartedMenuItem factory' do
    expect(FactoryGirl.build(:carted_menu_item)).to be_valid
  end

  describe '#subtotal' do
    it 'returns the subtotal of the price mulitiplied by the quatity' do
      carted_menu_item = build(:carted_menu_item, quantity: 10)
      price = carted_menu_item.menu_item.price
      expect(carted_menu_item.subtotal).to eq(price * 10)
    end
  end
end
