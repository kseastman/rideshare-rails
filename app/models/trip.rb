class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  paginates_per 20
end
