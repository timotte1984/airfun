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
    @gdays = @attraction.availabilities.where("date >= :start_date and date <= :end_date", ({start_date:@booking.start_date, end_date:@booking.end_date}))
    @gdays.each do |gday|
      gday.update(is_available: false);
    end
    authorize @booking
    if @booking.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:description, :start_date, :end_date, :place)
  end
end
