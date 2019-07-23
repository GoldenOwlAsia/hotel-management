require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validates room number' do
    let(:hotel) { create(:hotel) }
    let(:room) { build(:room, room_number: '102', hotel: hotel) }
    context 'valid' do
      it 'room number is not nil' do
        expect(room).to be_valid
      end
      it 'length of room number is less than or equal to 10' do
        expect(room).to be_valid
      end
    end
    context 'invalid' do
      let(:room_number_nil) { build(:room, room_number: nil) }
      let(:room_number_too_long) { build(:room, room_number: SecureRandom.alphanumeric(11)) }
      it 'room number is nil' do
        expect(room_number_nil).not_to be_valid
      end
      it 'room number is greater than 10' do
        expect(room_number_too_long).not_to be_valid
      end
    end
  end

  describe 'validates room status' do
    let(:hotel) { create(:hotel) }
    let(:room) { build(:room, status: 'available', hotel: hotel) }
    context 'valid' do
      it 'room status is not nil' do
        expect(room).to be_valid
      end
    end
    context 'invalid' do
      let(:room_status_nil) { build(:room, status: nil, hotel: hotel) }
      it 'room status is nil' do
        expect(room_status_nil).not_to be_valid
      end
    end
  end

  describe 'validates room type' do
    let(:hotel) { create(:hotel) }
    let(:room) { build(:room, room_type: 'queen', hotel: hotel) }
    context 'valid' do
      it 'room type is not nil' do
        expect(room).to be_valid
      end
    end
    context 'invalid' do
      let(:room_without_room_type) { build(:room, room_type: nil, hotel: hotel) }
      it 'room type is nil' do
        expect(room_without_room_type).not_to be_valid
      end
    end
  end

  describe 'validates hotel' do
    let(:hotel) { create(:hotel) }
    context 'valid' do
      let(:room) { build(:room, hotel: hotel) }
      it 'hotel is not nil' do
        expect(room).to be_valid
      end
    end
    context 'invalid' do
      let(:room) { build(:room, hotel: nil) }
      it 'hotel is nil' do
        expect(room).not_to be_valid
      end
    end
  end

  describe 'validates floor' do
    context 'valid' do
      let(:room) { build(:room, floor_number: 1) }
      it 'floor number is not nil' do
        expect(room).to be_valid
      end
    end
    context 'invalid' do
      let(:room) { build(:room, floor_number: nil) }
      it 'floor number is nil' do
        expect(room).not_to be_valid
      end
    end
  end

end
