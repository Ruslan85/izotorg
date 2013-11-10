class ProductsController < ApplicationController
  before_filter :find_the_manufacturer


  def index
    @products = @manufacturer.products.order("created_at").page(params[:page]).per(5)
  end

  def show
    @product = @manufacturer.products.find(params[:id])
  end

  def new
    @product = @manufacturer.products.new
  end

  def edit
    @product = @manufacturer.products.find(params[:id])
  end

  def create
    @product = @manufacturer.products.create(params[:product])
    if @product.save
      flash[:success] = "Product created!"
      redirect_to [@manufacturer, @product]
    else
      render action: "new"
    end
  end

  def update
    @product = @manufacturer.products.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:success] = "Product was successfully updated!"
      redirect_to [@manufacturer, @product]
    else
      render action: "edit"
    end
  end

  def destroy
    @product = @manufacturer.products.find(params[:id])
    @product.destroy

    redirect_to admin_products_path
  end


  private
  def find_the_manufacturer
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end
end
