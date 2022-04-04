require 'rails_helper'

RSpec.describe Role, type: :model do
  let!(:role1) { FactoryBot.create :role }

  describe 'attributes' do
    context 'Role is valid' do
      it 'valid role' do
        expect(role1).to be_valid
      end
    end

    context 'invalid when user is nil' do
      it 'valid role' do
        role1.user = nil
        expect(role1).to_not be_valid
      end
    end

    context 'invalid when group is nil' do
      it 'valid role' do
        role1.group = nil
        expect(role1).to_not be_valid
      end
    end

    context 'invalid when role is nil' do
      it 'role can not be nil' do
        role1.role = nil
        byebug
        expect(role1).to_not be_valid
      end
    end
  end
end
