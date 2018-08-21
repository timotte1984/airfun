class AvailabilityController < ApplicationController

  def destroy
    a = Availability.where(attraction_id: params[:attraction_id], date: params[:date]).first
    a.update(is_available: false)
    authorize a
    redirect_to attraction_path(params[:attraction_id])
  end
end
