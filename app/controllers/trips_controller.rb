class TripsController < ApplicationController

  def index
    respond_with @trips = Trip.all
  end

  def show
    respond_with @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.create(trip_params)
    respond_with @trip
  end

  def update
    @trip = Trip.find(params[:id])
    respond_with @trip.update(trip_params)
  end

  def destroy
    @trip = Trip.find(params[:id])
    respond_with @trip.destroy
  end

  private

  def trip_params
    params.require(:data)
      .permit(:name, :location_name, :latlong, :duration_days)
  end

end
