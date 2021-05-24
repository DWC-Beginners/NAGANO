<<<<<<< HEAD
class Publics::DeliveriesController < ApplicationController
=======
class Publics::DeliveriesController < Publics::ApplicationController
  
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new #?????
  end
  
  def edit
    @delivery = Delivery.find(params[:id])
  end
  
  def create
    delivery = Delivery.new(delivery_params)
    delivery.save
    redirect_to delivery_path(delivery.id)
  end
  
  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to delivery_path(delivery.id)
  end
  
  def destroy
    delivery = Delivery.find(params[:id])  
    delivery.destroy  
    redirect_to deliveries(@delivery.id) #←これいる？
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
    
  end
>>>>>>> origin/develop
end
