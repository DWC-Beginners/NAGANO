class Publics::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses
    @address  = Address.new
  end

  def edit
    @addresses  = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
   address.save
    redirect_to Address_path(address.id)
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to address_path(address.id)
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to deliveries(@address.id) #←これいる？
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)

  end
end
