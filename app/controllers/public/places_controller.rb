class Public::PlacesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @places = Place.all
    @place = Place.new
  end

  def create
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :price, :remarks)
  end
end
