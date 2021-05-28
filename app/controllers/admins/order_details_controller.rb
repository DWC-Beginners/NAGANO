class Admins::OrderDetailsController < ApplicationController
  #order_item
  def update
    @order_item = Oreder_item.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order.id)
  end

 private


　 def order_item_params
    params.require(:order_detail).permit(:price, :amount, :production_status, :order_id, :product_id)

   end
end
