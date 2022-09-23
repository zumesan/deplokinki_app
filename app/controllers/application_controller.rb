class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseに関するコントローラーの処理の場合にメソッドを実行する

  private
  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number])
  end
end
