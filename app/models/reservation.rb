class Reservation < ApplicationRecord

  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true
  validates :duration, presence: true
end
