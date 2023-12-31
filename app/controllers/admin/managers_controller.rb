class Admin::ManagersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @managers = Manager.all
    @manager = Manager.new
  end

  def create
    manager = Manager.new(manager_params)
    manager.save
  end

  def destroy
    manager.find(params: id)
    manager.destroy
  end

  private
  def manager_params
    params.require(:manager).permit(:name)
  end
end
