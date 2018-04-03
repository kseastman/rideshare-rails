class Passenger < ApplicationRecord
  has_many :trips

  paginates_per 20

  validates :name, presence: true
  validates :phone_num, presence: true
end
