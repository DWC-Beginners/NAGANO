class Admins::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])

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
    redirect_to admins_products_path(product.id)
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :genre_id, :sale_status, :genre_name)
  end
end
