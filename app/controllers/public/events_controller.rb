class Public::EventsController < ApplicationController
  before_action :authenticate_customer!

  def create
  end
  
  def index
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def event_params
    params.require(:event).permit(:is_correspondence, :note, :trash, :status)
  end
end
