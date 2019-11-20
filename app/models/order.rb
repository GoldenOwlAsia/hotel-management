# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  customer_id    :bigint           not null
#  order_date     :datetime
#  total          :decimal(, )
#  paid           :decimal(, )
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :booking
  belongs_to :customer
  enum payment_method: { cash: 'cash', credit_card: 'credit_card', bank_transfer: 'bank_transfer' }
end
