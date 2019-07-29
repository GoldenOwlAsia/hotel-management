# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  room_number  :string
#  room_type    :string
#  hotel_id     :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  floor_number :integer
#  status       :string
#

require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:room_number) }
    it { should validate_length_of(:room_number).is_at_most(10) }
  it { should validate_presence_of(:room_type) }
    it { should validate_presence_of(:floor_number) }
  end

  describe 'associations' do
    it { should belong_to(:hotel) }
  end

end
