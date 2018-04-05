class Driver < ApplicationRecord
  has_many :trips

  paginates_per 20

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    subtotal = 0
    fee = 1.85
    self.trips.each do |trip|
      if trip.cost.is_a? Numeric
        subtotal += trip.cost
      end
    end
    subtotal /= 100
    total = (subtotal - fee) * 0.8

    return total.round(2)
  end

  def average_rating
    rating = 0.0
    denominator = 0
    self.trips.each do |trip|
      if trip.rating.is_a? Numeric
        rating += trip.rating
        denominator += 1
      end
    end
    average = rating / denominator

    return average
  end

  def _trips
    my_trips = self.trips.order(:date)
    return my_trips
  end

  def tripcount
    return _trips.count
  end

  def available?
    return true if no_trips?

    _trips.last.rating ? true : false
  end

  def no_trips?
    if self.trips.empty?
      return true
    end
    return false
  end

  def last_trip_date
    unless no_trips?
      return _trips.last.date
    end
  end

end
