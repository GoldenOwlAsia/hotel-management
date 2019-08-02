class Order < ApplicationRecord
  has_many :service_orders
  has_many :services, through: :service_orders, source: :services
end
