class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating,
    numericality: {allow_nil: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "must be between 1 and 5"}

  paginates_per 20

  def new_date
    return  DateTime.now
  end

  def new_cost
    rand(1000..99999)
  end

  def completed?
    return self.rating != nil
  end

  def find_driver
    drivers = Driver.all.select { |driver| driver.available? }
    available_driver = drivers.first

    drivers.each do |driver|
      return driver if driver.no_trips?

      if driver.last_trip_date < available_driver.last_trip_date
        available_driver = driver
      end
    end

    return available_driver
  end

end
