class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product =  Product.new(product_params)
    @product.save
    redirect_to admin_product_path(product_id)
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admin_product_path(product_id)
  end
  
  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :genre_id)
  end
end
