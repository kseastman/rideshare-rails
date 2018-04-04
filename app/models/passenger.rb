class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  paginates_per 20

  def total_cost
    total = 0
    self.trips.each do |trip|
      if trip.cost
        total += trip.cost
      end
    end

    return (total / 100).round(2)
  end
end
