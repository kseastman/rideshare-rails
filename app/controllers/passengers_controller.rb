class PassengersController < ApplicationController
  def index
    @passengers = Passenger.order(:name).page params[:page]
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.assign_attributes(passenger_params)

    if @passenger.save
      redirect_to passenger_path(passenger)
    else
      render :edit
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])

    if @passenger.ongoing_trip?
      redirect_to driver_path
    else
      @passenger.destroy
      redirect_to passengers_path
    end
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
