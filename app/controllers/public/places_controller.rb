class Public::PlacesController < ApplicationController
  before_action :authenticate_customer!

  def index
    customer = current_customer
    @places = customer.places
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.customer_id = current_customer.id
    customer = current_customer
    @places = customer.places
    if @place.save
      redirect_to places_path
    else
      flash.now[:alert] = "Please add again"
      render :index
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    place = Place.find(params[:id])
    if place.update(place_params)
      redirect_to places_path
    else
      flash.now[:alert] = "Sorry, we failed"
      render :edit
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    redirect_to request.referer, notice: "We destroyed the place"
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :price, :remarks)
  end
end
