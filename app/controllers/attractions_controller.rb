class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_attraction, only: [:show, :edit, :update]

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

  end

  def edit
  end

  def update
  end

  def destroy
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
