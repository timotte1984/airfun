class BookingsController < ApplicationController

  def index
  end

  def new
    @booking = Booking.new
    @attraction = Attraction.find(params[:attraction_id])
    @user = current_user
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @attraction = Attraction.find(params[:attraction_id])
    @booking.attraction = @attraction
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to attractions_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :start_time, :end_time, :place)
  end
end
