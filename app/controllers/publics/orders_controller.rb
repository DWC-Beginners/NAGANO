class Publics::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm #ここ間違ってると思われる
    @order = Oreder.find(params[:id])
    @order = Order.new(order_params)
    return if @order.valid?
    render :new
  end


  def complete

  end

  def index
    @orders = Order.all
  end

  def show
    @order = Oreder.find(params[:id])
  end

  def create　#comfirmとの関係性よくわからん
    order = Order.new(order_params)
    order.save
    redirect_to comfirem_path(order.id)
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)

  end


end
