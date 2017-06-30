require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'has a valid User factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it 'has a valid Admin factory' do
      expect(FactoryGirl.build(:admin)).to be_valid
    end

    it 'is invalid if menu item already exists with the same name' do
      user1 = create(:user, email: 'joe_user@test.com')
      user2 = build(:user, email: 'joe_user@test.com')
      expect(user2).to_not be_valid
    end
  end
end