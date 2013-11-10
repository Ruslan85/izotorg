class ProductsController < ApplicationController
  before_filter :find_the_manufacturer


  def index
    @products = @manufacturer.products.order("created_at").page(params[:page]).per(5)
  end

  def show
    @product = @manufacturer.products.find(params[:id])
  end


  private

  def find_the_manufacturer
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end
end
