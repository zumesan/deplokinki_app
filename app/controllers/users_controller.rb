class UsersController < ApplicationController
  def show
    @deplo = Deplo.where(user_id: current_user.id) #deploテーブル内のuser_idと、ログイン中ユーザーのidが同じレコードを抽出
  end
end
