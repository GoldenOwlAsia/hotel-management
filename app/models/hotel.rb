class Hotel < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 150 }

  has_many :rooms
  has_many :roles
  has_many :users, through: :roles, source: :user
end
