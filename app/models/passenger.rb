class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy

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

    return total
  end

  def ongoing_trip?
    return false if self.trips.empty?

    self.trips.each do |trip|
      return true if trip.rating.nil?
    end

    return false
  end
end
