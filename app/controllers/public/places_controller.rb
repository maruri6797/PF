class Public::PlacesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @places = Place.all
    @place = Place.new
  end

  def create
    place = Place.new(place_params)
    place.save
    redirect_to places_path
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    place = Place.find(params[:id])
    place.update(place_params)
    redirect_to places_path
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to request.referer
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :price, :remarks)
  end
end
