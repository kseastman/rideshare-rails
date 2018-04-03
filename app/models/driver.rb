class Driver < ApplicationRecord
  has_many :trips

  paginates_per 20

  validates :name, presence: true
  validates :vin, presence: true
end
