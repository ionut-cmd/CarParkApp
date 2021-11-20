class Carpark < ApplicationRecord
  has_many :reservations

  validates :location, presence: true, uniqueness: true
  validates :available, presence: true
  validates :total, presence:true
  validates :green, presence:true
  validates :disabled, presence:true

end
