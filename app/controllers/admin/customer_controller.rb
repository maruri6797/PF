class Admin::CustomerController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    admin = current_admin
    @customers = admin.customers
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
end
