<<<<<<< HEAD
class OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order
  end
  
  def show
    @order = Order.find(params[:id])
    
  end
  
  def update
  end
  
  private

  def order_params
    params.require(:order).permit(:created_at, :customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    .merge(prefecture: params[:address][:prefecture].to_i)
end
  end
  
=======
class Admins::OrdersController < Admins::ApplicationController
>>>>>>> origin/develop
end
