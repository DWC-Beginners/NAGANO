class Publics::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @customer = current_customer
    @product = Product.find(params[:id])
    @cart_item = CartItem.new

  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :genre_id)
  end
end
