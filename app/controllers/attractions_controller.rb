class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    if params["query"].present? and params["range"].present?
      match_data = /(?<start>.*) to (?<end>.*)/.match(params[:range])
      start_date = match_data[:start]
      end_date = match_data[:end]
      @attractions = policy_scope(Attraction).order(created_at: :desc)
      @attractions = Attraction.near(params['query'], 100)
      # @attractions = @attractions.joins(:bookings).where("bookings.start_date <= ? OR bookings.end_date >= ?", start_date, end_date)
      # @attractions = @attractions.joins(:bookings).where("(bookings.start_date >= #{start_date} AND bookings.start_date <= #{end_date}) OR (bookings.end_date >= #{start_date} AND bookings.end_date <= #{end_date})")
      # @attractions = @attractions.joins(:bookings).where("(bookings.start_date >= CAST( #{start_date} as DATE))")
      @attractions = @attractions.joins(:bookings).where("bookings.start_date >= CAST(#{Date.parse(start_date)} AS DATE)")
      raise
    else
      @attractions = policy_scope(Attraction).order(created_at: :desc)
    end
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
    @attraction.image_url = Attraction.first.image_url
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
    params.require(:attraction).permit(:name, :attraction_type, :image_url, :playersmax, :photo, :photo_cache,:description, :price, :location)
  end
end
