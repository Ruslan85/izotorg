class ThingsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :find_the_manufacturer


  def index
    @things = @manufacturer.things.order("created_at").page(params[:page]).per(5)
  end

  def show
    @thing = @manufacturer.things.find(params[:id])
  end

  def new
    @thing = @manufacturer.things.build
  end

  def edit
    @thing = @manufacturer.things.find(params[:id])
  end

  def create
    @thing = @manufacturer.things.create(params[:thing])
    if @thing.save
      flash[:success] = "Thing created!"
      redirect_to [@manufacturer, @thing]   
    else
      render action: "new" 
    end
  end

  def update
      @thing = @manufacturer.things.find(params[:id])

      if @thing.update_attributes(params[:thing])
        flash[:success] = "Product was successfully updated!"
        redirect_to [@manufacturer, @thing]   
      else
        render action: "edit" 
      end
  end

  def destroy
    @thing = @manufacturer.things.find(params[:id])
    @thing.destroy

    redirect_to manufacturer_things_path(@manufacturer)
  end


  private
  def find_the_manufacturer
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end
end
