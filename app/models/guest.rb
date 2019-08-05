class Guest < ApplicationRecord
  belongs_to :booking

  enum guest_type: { women: 'women', men: 'men', baby_girl: 'baby_girl', baby_boy: 'baby_boy' }
end
