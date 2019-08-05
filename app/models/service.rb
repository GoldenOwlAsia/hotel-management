class Service < ApplicationRecord
  has_many :service_orders
  has_many :orders, through: :service_order, source: :orders
end
