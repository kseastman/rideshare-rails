class Passenger < ApplicationRecord
  has_many :trips

  paginates_per 20

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_cost
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end

    return (total / 100).round(2)
  end

  def request_trip
    return self.id
  end
end
