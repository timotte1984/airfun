class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = policy_scope(Attraction).order(created_at: :desc)
  end

  def show

    @markers = @attraction.bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end

    # @markers = @attraction.availabilities.select {|avai| avai.is_available == false}
    # @markers = @markers.map do |avai|
    #   {
    #     from: avai.date,
    #     to: avai.date
    #   }
    # end

    if @attraction.user == nil
      @owner == false
    elsif @attraction.user == current_user
      @owner = true
    end
  end

  def new
    @attraction = Attraction.new
    authorize @attraction
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.user = current_user
    authorize @attraction
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @user_id = current_user
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
    authorize @attraction
  end

  def attraction_params
    params.require(:attraction).permit(:name, :attraction_type, :playersmax, :photo, :photo_cache,:description, :price, :location)
  end

end
