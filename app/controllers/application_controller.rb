class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if admin_signed_in?
    admins_homes_top_path # ログイン後に遷移するpathを設定
    else
    customer_path(current_customer)
    end

  end

  def after_sign_out_path_for(resource)
    new_customer_session_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,
    :last_name_kana, :postal_code, :address, :email, :phone_number, :is_deleted])
  end
end