class Order < ApplicationRecord
  has_many :service_orders
  has_many :services, through: :service_orders, source: :services

  enum payment_method: { cash: 'cash', credit_card: 'credit_card', bank_transfer: 'bank_transfer' }
end
