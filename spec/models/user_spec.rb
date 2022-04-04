require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { FactoryBot.create(:user) }

  describe 'attributes' do
    context 'passes when first and last name is provided' do
      it 'first and last name provided' do
        expect(user1).to be_valid
      end
    end

    context 'first_name' do
      it 'is required' do
        user1.first_name = nil
        expect(user1).to_not be_valid
      end
    end

    context 'last_name' do
      it 'is required' do
        user1.last_name = nil
        expect(user1).to_not be_valid
      end
    end
  end
end
