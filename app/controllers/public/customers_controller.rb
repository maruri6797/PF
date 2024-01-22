class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_customer

  def edit

  end

  def show
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(customer)
    else
      flash.now[:alert] = "Sorry, we failed"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :image)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end
end
