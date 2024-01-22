class Public::EventsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    customer = current_customer
    @events = customer.events
    @places = customer.places
    if event.save
      redirect_to events_path
    else
      flash.now[:alert] = "Please add again"
      render :index
    end
  end

  def index
    customer = current_customer
    @events = customer.events
    @places = customer.places
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "Sorry, we failed"
      render :show
    end
  end

  def destroy
    event.Event.find(params[:id])
    event.destroy
    redirect_to request.referer, notice: "We destroyed the event"
  end

  private

  def event_params
    params.require(:event).permit(:is_correspondence, :note, :trash, :status, :start_time, :place_id)
  end
end