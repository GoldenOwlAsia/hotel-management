require 'rails_helper'

RSpec.describe Room, type: :model do
  
  describe 'validates room number' do
    it { should validate_presence_of(:room_number) }
    it { should validate_length_of(:room_number).is_at_most(10) }
  end

  describe 'validates room status' do
    it { should validate_presence_of(:status) }
  end

  describe 'validates room type' do
    it { should validate_presence_of(:room_type) }
  end

  describe 'validates hotel' do
    it { should belong_to(:hotel) }
  end

  describe 'validates floor' do
    it { should validate_presence_of(:floor_number) }
  end

end
