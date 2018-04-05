class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating,
    numericality: {allow_nil: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  paginates_per 20

  def new_date
    return  DateTime.now
  end

  def new_cost
    rand(1000..99999)
  end

  def find_driver
    drivers = Driver.all
    available_driver = drivers.first

    if available_driver.no_trips?
      return available_driver
    end

    drivers.each do |driver|
      if driver.available?
        if driver.no_trips?
          available_driver = driver

        elsif driver.last_trip_date < available_driver.last_trip_date
          available_driver = driver

        end
      end
    end
    return available_driver
  end

end
