class Reservation < ApplicationRecord
  # belongs_to :carpark
  belongs_to :user

  # custom validators
validate :validate_bay, on: :create
validate :validate_availability, on: :create


  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true, length: {minimum: 6}, format: { with: /\A[0-9a-zA-Z]+\z/,
    message: "only allows letters and numbers" }
  validates :duration, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 24, only_integer: true}
  scope :user_reservations, ->(user) { where(['user_id = ?', user.id]) }

  before_save :calculate_price

# Calculates sesion price
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

# Returns the green or disabled available spaces
  def get_carpark_bay
    case location
    when 'airport'
      my_index = 1
    when 'hospital'
      my_index = 2
    when 'retail_park'
      my_index = 3
    when 'park_and_ride'
      my_index = 4
    end
    @carpark = Carpark.find(my_index)

    case bay_type
    when 'green'
      return @carpark.green
    when 'disabled'
      return @carpark.disabled
    else
      return 1
    end
  end



# Custom validation to chech if there are any green spacees available in carpark
  def validate_bay
    if get_carpark_bay <= 0
      errors.add(:bay_type, "not available in the #{location} carpark")
    end
  end

  def validate_availability
    if @carpark.available <= 0
      errors.add(:location, "no more sapces available at #{location}")
    end
  end
end
