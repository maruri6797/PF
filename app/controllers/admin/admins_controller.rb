class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def show
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_admin_path(admin)
    else
      flash.now[:alert] = "Sorry, we failed"
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :company, :phone)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
