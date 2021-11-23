class Reservation < ApplicationRecord
  # belongs_to :carpark
  belongs_to :user

  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true, length: {minimum: 6}, format: { with: /\A[0-9a-zA-Z]+\z/,
    message: "only allows letters and numbers" }
  validates :duration, presence: true, numericality: {greater_than_or_equal_to: 1}

  scope :user_reservations, ->(user) { where(['user_id = ?', user.id]) }

  before_save :calculate_price

  def calculate_price
    self.price = 2.5
    value = duration * price
    self.price = value
  end

end
