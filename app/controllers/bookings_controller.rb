class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    authorize @booking
  end
end
