require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:group1) { FactoryBot.create :group }

  describe 'attributes' do
    context 'name is provided' do
      it 'passes when name is provide' do
        expect(group1).to be_valid
      end
    end

    context 'name' do
      it 'is required' do
        group1.name = nil
        expect(group1).to_not be_valid
      end
    end
  end
end
