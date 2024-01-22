class Admin::EventsController < ApplicationController
  def index
    customer = current_admin.customers
    @events = customer.events
  end
end
