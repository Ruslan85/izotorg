class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.order("created_at").page(params[:page]).per(5) 
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end
end
