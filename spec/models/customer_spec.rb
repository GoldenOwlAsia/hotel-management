# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :string
#  customer_nin :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:customer_nin) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(30) }
    it { is_expected.to validate_length_of(:phone_number).is_at_most(10) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:bookings) }
  end
end
