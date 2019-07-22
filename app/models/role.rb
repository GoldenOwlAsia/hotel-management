class Role < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  enum name: { owner: 'owner', staff: 'staff' }
end
