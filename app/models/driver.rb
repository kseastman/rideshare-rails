class Driver < ApplicationRecord
  has_many :trips
   paginates_per 20
end
