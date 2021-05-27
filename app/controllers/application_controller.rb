class ApplicationController < ActionController::Base
#   before_action :authenticate_user!

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
end