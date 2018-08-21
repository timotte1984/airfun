class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = policy_scope(Attraction).order(created_at: :desc)
  end

  def show
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

  def attraction_params
    params.require(:attraction).permit(:name, :attraction_type, :playersmax)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
    authorize @attraction
  end

  def params_attraction
    params.require(:attraction).permit(:name, :attraction_type, :playersmax, :description, :price, :location)
  end

end
