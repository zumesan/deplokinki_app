class DeplosController < ApplicationController
  before_action :set_deplo, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]

  def index
    @deplos = Deplo.all
    #@mies = Deplo.where(category_id: 1)
    #@shigas = Deplo.where(prefecture_id: 2)
    #@kyotos = Deplo.where(prefecture_id: 3)
    #@osakas = Deplo.where(prefecture_id: 4)
    #@hyogos = Deplo.where(prefecture_id: 5)
    #@naras = Deplo.where(prefecture_id: 6)
    #@wakayamas = Deplo.where(prefecture_id: 7)
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

private
  def set_deplo
    @deplo = Deplo.find(params[:id])
  end

  def deplo_params
    params.require(:deplo).permit(:deplo_title, :deplo_info, :municipality, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end
end