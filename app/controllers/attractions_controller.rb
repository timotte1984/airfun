class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def create
  end

  def new
  end
end
