class Admins::ProductsController < ApplicationController

  def index
    @product = Product.page(params[:page]).reverse_order
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admins_product_path(product_id)
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :genre_id, :sale_status)
  end
end
