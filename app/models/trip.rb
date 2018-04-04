class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

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

    unless available_driver.trips
      return available
    end

    drivers.each do |driver|
      if driver.available?
        if driver.last_trip_date < available.last_trip_date
          available = driver
        end
      end
    end
    return available.id
  end

end
