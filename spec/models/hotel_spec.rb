require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_presence_of(:address) }
    it { should validate_length_of(:address).is_at_most(150) }
  end

  describe 'associations' do
    it { should have_many(:rooms) }
  end

end
