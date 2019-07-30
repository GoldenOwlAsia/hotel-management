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
end
