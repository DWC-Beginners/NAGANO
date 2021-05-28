class Publics::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)

  end

  def create
    @cart_items = current_customer.cart_items.build(cart_product_params)
    if
      @cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item][:product_id])
      @cart_item.quantity += params[:cart_item][:quantity].to_i
      @cart_item.save
      redirect_to cart_items_path
    else
      @cart_items.save
      redirect_to cart_items_path
    end
  end


  def update
     @cart_items = CartItems.find(params[:id])
     @cart_items.update(cart_item_params)
    redirect_to cart_items_path

  end

  def destroy
    @cart_items = CartItems.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end


  def all_destroy
    @cart_items = current_customer.cart_item_products
    @cart_items.destroy.all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id, :customer_id)
  end

end
