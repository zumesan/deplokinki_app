class ApplicationController < ActionController::Base
  before_action :basic_auth if Rails.env.production? # テスト時はbasic認証を行わないよう分岐
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseに関するコントローラーの処理の場合にメソッドを実行する
  before_action :set_search
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    # 新規登録時、deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number])
    # 登録情報更新時、deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :phone_number])
  end

  def set_search
    @q = Deplo.ransack(params[:q]) #検索オブジェクトを生成、paramsでransackを使用したフォームから送られてくるパラメーターを受け取る。
    @searches = @q.result #resultで検索結果を取得する
  end

end
