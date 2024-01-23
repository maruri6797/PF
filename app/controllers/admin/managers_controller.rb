class Admin::ManagersController < ApplicationController
  before_action :authenticate_admin!

  def index
    admin = current_admin
    @managers = admin.managers
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.admin_id = current_admin.id
    admin = current_admin
    @managers = admin.managers
    if @manager.save
      redirect_to admin_managers_path
    else
      flash.now[:alert] = "Sorry, we failed"
      render :index
    end
  end

  def destroy
    manager.find(params: id)
    manager.destroy
    redirect_to request.referer
  end

  private
  def manager_params
    params.require(:manager).permit(:name)
  end
end
