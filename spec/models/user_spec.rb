require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid User factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'has a valid Admin factory' do
    expect(FactoryGirl.build(:admin)).to be_valid
  end
end