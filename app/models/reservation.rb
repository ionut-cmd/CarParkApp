class Reservation < ApplicationRecord
  # belongs_to :carpark
  belongs_to :user
  # custom validators
  validate :validate_bay, on: :create
  validate :validate_availability, on: :create
  validate :validate_time_availability, on: :create


  validates :location, presence: true
  validates :bay_type, presence: true
  validates :vehicle_registration, presence: true, length: {minimum: 6}, format: { with: /\A[0-9a-zA-Z]+\z/,
    message: "only allows letters and numbers" }
  validates :duration, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 24, only_integer: true}
  scope :user_reservations, ->(user) { where(['user_id = ?', user.id]) }
  before_save :calculate_price
  before_save :calculate_finish

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

# Calculates finsh_time
  def calculate_finish
    finsh_time = duration * 60
    self.fisnish = start + finsh_time.minutes
  end
# Returns the green or disabled available spaces
  def get_carpark_bay
    @carpark = Carpark.find_or_create_by(location: location )

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


  def validate_time_availability
    all_reservations = Reservation.all
    times = Array.new
    for rez in all_reservations
      finish_time = (rez.fisnish.hour)
      times.push(finish_time)
    end

    if Reservation.exists?
      start_time = (start.hour)
      times.sort
      if start_time >= times.last
        valid = true
      else
        valid = false
      end
    end


    if valid == false
      errors.add(:start, "You have overlapping rezervations, please select different start time")
    end
  end
end
