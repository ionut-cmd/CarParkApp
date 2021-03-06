class Carpark < ApplicationRecord
  has_many :reservations

  validates :location, presence: true, uniqueness: true
  validates :available, presence: true, numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :total, presence:true, numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :green, presence:true, numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :disabled, presence:true, numericality: {greater_than_or_equal_to: 0, only_integer: true}

end
