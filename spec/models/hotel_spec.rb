require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validate hotel name' do
    context 'valid' do
      let(:user) { create(:user) }
      let(:hotel) { build(:hotel, name: 'Happy') }
      it 'name is not nil' do
        expect(hotel).to be_valid
      end
      it 'length is less than or equal to 30' do
        expect(hotel).to be_valid
      end
    end
    context 'invalid' do
      let(:hotel) { build(:hotel, name: nil) }
      it 'name is nil' do
        expect(hotel).not_to be_valid
      end
    end
  end

  describe 'validates hotel address' do
    let(:user) { create(:user) }
    context 'valid' do
      let(:hotel) { build(:hotel, address: '145 Nguyen Huu Tho, Quan 7, Ho Chi Minh') }
      it 'address is not nil' do
        expect(hotel).to be_valid
      end
      it 'address length is less than or equal to 150' do
        hotel = build(:hotel, address: SecureRandom.alphanumeric(149))
        expect(hotel).to be_valid
      end
    end
    context 'invalid' do
      let(:hotel) { build(:hotel, address: nil) }
      it 'address is nil' do
        expect(hotel).not_to be_valid
      end
      it 'address length is greater than 150' do
        hotel = build(:hotel, address: SecureRandom.alphanumeric(151))
        expect(hotel).not_to be_valid
      end
    end
  end

end
