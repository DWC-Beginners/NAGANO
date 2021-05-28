class Publics::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order.per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new

  end

  private
  def product_params
    params.require(:product).permit(:image_id, :name, :description, :price, :genre_id)
  end
end
