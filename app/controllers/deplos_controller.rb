class DeplosController < ApplicationController
  before_action :set_deplo, except: [:index, :prefecture, :new, :create]
  before_action :authenticate_user!, except: [:index, :prefecture, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :set_search

  def index
    @deplos = Deplo.all
  end

  def prefecture
    @deplo = Deplo.find_by(prefecture_id: params[:id])
    @deplos = Deplo.where(prefecture_id: params[:id]).order('created_at DESC')
  end

  def new
    @deplo = Deplo.new
  end

  def show
  end

  def create
    @deplo = Deplo.new(deplo_params)
    if @deplo.save
      redirect_to root_path
    else
      render :new
      return
    end
  end

  def edit
  end

  def update
    if @deplo.update(deplo_params)
      redirect_to deplo_path(@deplo)
    else
      render :edit
    end
  end

  def destroy
    deplo = Deplo.find(params[:id])
    if deplo.destroy
      redirect_to root_path
    end
  end

  

private
  def set_deplo
    @deplo = Deplo.find(params[:id])
  end

  def deplo_params
    params.require(:deplo).permit(:deplo_title, :deplo_info, :municipality, :category_id, :prefecture_id, {images: []} ).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @deplo.user 
  end

  def set_search
    @search = Deplo.ransack(params[:q]) #検索オブジェクトを生成、paramsでransackを使用したフォームから送られてくるパラメーターを受け取る。
    @searches = @search.result #resultで検索結果を取得する
  end

end