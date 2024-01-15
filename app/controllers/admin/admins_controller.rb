class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def show
  end

  def edit
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
