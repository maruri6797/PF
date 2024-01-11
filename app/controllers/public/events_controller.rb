class Public::EventsController < ApplicationController
  before_action :authenticate_customer!

  def create
    event = Event.new(event_params)
    event.save
    redirect_to event_path
  end

  def index
    customer = current_customer
    @events = customer.events
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    event.Event.find(params[:id])
    event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:is_correspondence, :note, :trash, :status, :start_time, :place_id)
  end
end