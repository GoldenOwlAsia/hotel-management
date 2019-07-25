require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:hotel) }
  end
end
