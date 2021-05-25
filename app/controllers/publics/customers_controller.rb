class Publics::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  # 更新成功失敗時にフラッシュメッセージ必要か？
  def update
    @customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
  end

  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end


  private
  def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana,
    :last_name_kana, :postal_code, :address, :email, :phone_number, :is_deleted, :encrypted_password)
  end
end
