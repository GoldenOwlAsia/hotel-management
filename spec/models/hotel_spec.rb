require 'rails_helper'

RSpec.describe Hotel, type: :model do
  describe 'validate hotel name' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30) }
  end

  describe 'validates hotel address' do
    it { should validate_presence_of(:address) }
    it { should validate_length_of(:address).is_at_most(150) }
  end

  describe 'associated' do
    it { should have_many(:rooms) }
  end
  
end
