# == Schema Information
#
# Table name: hotels
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_length_of(:address).is_at_most(150) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:rooms) }
  end

end
