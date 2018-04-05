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

    return (total / 100).round(2)
  end

  # def ordered_trips
  #   return false if self.trips.empty?
  #   return self.trips.order(:date)
  # end

  def ongoing_trip?
    return false if self.trips.empty?

    self.trips.each do |trip|
      return false if trip.rating.nil?
    end

    return true
  end
end
