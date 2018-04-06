class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy

  paginates_per 20

  validates :name, presence: true
  validates :vin, presence: true

  def no_trips?
    return self.trips.empty?
  end

  def completed_trips
    completed_trips = self.trips.select do |trip|
      trip.rating != nil
    end

    return completed_trips
  end

  def total_earnings
    subtotal = 0
    fee = 165
    driver_share = 0.8

    trips_with_cost = self.trips.select do |trip|
      trip.cost != nil
    end

    trips_with_cost.each do |trip|
      if fee > trip.cost
        subtotal += trip.cost
      else
        subtotal += (trip.cost - fee)
      end
    end
    total = subtotal * driver_share

    return total
  end

  def average_rating
    return "---" if completed_trips.empty?

    total = 0.0
    completed_trips.each do |trip|
      total += trip.rating
    end
    average = total / completed_trips.length

    return average.round(1)
  end

  def ordered_trips
    return self.trips.order(:date)
  end

  def available?
    return true if no_trips?

    return ordered_trips.last.rating ? true : false
  end

  def last_trip_date
    unless no_trips?
      return ordered_trips.last.date
    end
  end
end
