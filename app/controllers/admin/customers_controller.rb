class CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    # アップデートが正常に出来た場合その会員の詳細ページに遷移する
    # アップデートが正常に行われなかった場合編集ページを表示する
    if @customer.update(customer_params)
      redirect_to admin_customer_path
    else
      render edit
    end
  end

  private
  #管理者から編集できる情報だけ必要なのでパスワードや会員IDは記述していない
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana,
    :last_name_kana, :postal_code, :address, :email, :phone_number, :is_deleted)
  end

end
