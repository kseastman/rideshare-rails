class Driver < ApplicationRecord
  has_many :trips

  paginates_per 20

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    subtotal = 0
    fee = 1.85
    self.trips.each do |trip|
      subtotal += trip.cost
    end
    subtotal /= 100
    total = (subtotal - fee) * 0.8

    return total.round(2)
  end

  def average_rating
    rating = 0.0
    denominator = self.trips.count

    self.trips.each do |trip|
      rating += trip.rating
    end
    average = rating / denominator

    return average
  end

end
