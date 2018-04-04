class TripsController < ApplicationController
  def index
    @trips = Trip.order(:id).page params[:page]
  end

  def new
    @trip = Trip.new

  end

  def create
    trip = Trip.new

    trip.passenger_id = params[:passenger_id]
    trip.driver_id = trip.find_driver.id
    trip.date = trip.new_date
    trip.cost = trip.new_cost

    if trip.save
      redirect_to trip_path(trip)
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.assign_attributes(trip_params)

    if trip.save
      redirect_to trip_path(trip)
    end
  end

  def destroy

    Trip.destroy(params[:id])

    redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:passenger_id, :driver_id)
  end
end
