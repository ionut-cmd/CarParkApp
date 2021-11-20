class Reservation < ApplicationRecord
  # belongs_to :carpark
  belongs_to :user

  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true
  validates :duration, presence: true

  scope :user_reservations, ->(user) { where(['user_id = ?', user.id]) }
end
