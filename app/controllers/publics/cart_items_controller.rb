class Publics::CartItemsController < Publics::ApplicationController
  def index
    @cart_items = @customer.cart_items.includes(:pro)
    @total_payment = @cart_items.sum{|cart_item|(cart_item.product.price * 1.1).floor * cart_item.amount}
    
  end
  
  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.save
    redirect_to cart_items_path
  end
  
  
  def update
     @cart_items = CartItems.find(params[:id])
    if @cart_items.update(cart_item_params)
      redirect_to cart_item_path,success: '個数を変更しました'
    else
      render :index, danger: "個数の変更に失敗しました。"
    end
  
  end
  
  def destroy
    @cart_items = CartItems.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end
    
  
  def all_destroy
    @customer.cart_items.all_destroy
     redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id, :customer_id)
  end
  
end
