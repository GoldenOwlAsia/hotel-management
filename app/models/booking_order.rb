class BookingOrder < ApplicationRecord
  belongs_to :booking
  belongs_to :order
end
