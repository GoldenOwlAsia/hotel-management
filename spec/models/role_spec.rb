require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validates user' do
    let(:user) { create(:user) }
    context 'valid' do
      let(:role) { build(:role, user: user) }
      it 'user id is not nil' do
        expect(role).to be_valid
      end
    end

    context 'invalid' do
      let(:role_without_user_id) { build(:role, user: user, hotel: nil) }
      it 'user is nil' do
        expect(role_without_user_id).not_to be_valid
      end
    end
  end

  describe 'validate hotel' do
    context 'valid' do
      let(:hotel) { create(:hotel) }
      let(:role) { build(:role, hotel: hotel) }
      it 'hotel is not nil' do
        expect(role).to be_valid
      end
    end
    context 'invalid' do
      let(:role_without_hotel_id) { build(:role, hotel: nil) }
      it 'hotel id is nil' do
        expect(role_without_hotel_id).not_to be_valid
      end
    end
  end
end
