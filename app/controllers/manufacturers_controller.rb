class ManufacturersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @manufacturers = Manufacturer.order("created_at").page(params[:page]).per(5) #Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
      @manufacturer = Manufacturer.new(params[:manufacturer])

      if @manufacturer.save
        redirect_to @manufacturer, notice: 'Manufacturer was successfully created.' 
      else
        render action: "new" 
      end
  end

  def update
      @manufacturer = Manufacturer.find(params[:id])

      if @manufacturer.update_attributes(params[:manufacturer])
        redirect_to @manufacturer, notice: 'Manufacturer was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_url 
  end

end
