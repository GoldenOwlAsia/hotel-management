module BookingsHelper
  def get_rent_type_text(rent_type = :hourly)
    {
      hourly: 'Theo giờ',
      overnight: 'Qua đêm'
    }.with_indifferent_access.fetch(rent_type, nil)
  end
end
