class Admin::CustomerController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.all
  end
end
