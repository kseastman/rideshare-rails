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
end
