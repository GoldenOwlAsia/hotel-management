# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint           not null
#  hotel_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:hotel) }
  end
end
