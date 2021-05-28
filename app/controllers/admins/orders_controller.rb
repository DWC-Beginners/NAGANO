class Admins::OrdersController < ApplicationController
  
  def show
    @order = Oreder.find(params[:id])
  end
  
  def update
    @order = Oreder.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    
  end
  
end
