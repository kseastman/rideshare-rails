module TripsHelper

  def set_rating(trip)
    return trip.rating if trip.rating
    yield
  end
end
