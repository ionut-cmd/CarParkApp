class Reservation < ApplicationRecord
  # belongs_to :carpark
  belongs_to :user

  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true, length: {minimum: 6}, format: { with: /\A[0-9a-zA-Z]+\z/,
    message: "only allows letters and numbers" }
  validates :duration, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 24, only_integer: true}
  scope :user_reservations, ->(user) { where(['user_id = ?', user.id]) }

  before_save :calculate_price

  def calculate_price
    if duration == 1
      self.price = 1.2
    elsif duration > 1 && duration <= 2
      self.price = 2
    elsif duration > 2 && duration <= 4
      self.price = 3.6
    else
      self.price = 5.7
    end
  end

end
