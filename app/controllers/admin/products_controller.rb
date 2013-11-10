class Admin::ProductsController < ApplicationController

  layout "admin"


  def index
    @products = if params[:manufacturer_id].present?
      @manufacturer = Manufacturer.find(params[:manufacturer_id])
      @manufacturer.products
    else
      Product.scoped
    end
    @products = @products.order("created_at").page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(params[:product])
    if @product.save
      flash[:success] = "Product created!"
      redirect_to [:admin, @product]   
    else
      render action: "new" 
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Product was successfully updated!"
      redirect_to [:admin, @product]   
    else
      render action: "edit" 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to  admin_products_path(@manufacturer)
  end
end
