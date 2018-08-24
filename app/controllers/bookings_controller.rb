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
    @booking = Booking.new
    @attraction = Attraction.find(params[:attraction_id])
    @booking.attraction = @attraction
    @booking.user = current_user
    match_data = /(?<start>.*) to (?<end>.*)/.match(params[:query])
    @booking.start_date = match_data[:start]
    @booking.end_date = match_data[:end]
    authorize @booking
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :start_date, :end_date, :place)
  end
end
