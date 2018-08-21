class AttractionsController < ApplicationController
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
