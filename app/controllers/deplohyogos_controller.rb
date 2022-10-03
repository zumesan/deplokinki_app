class DeplohyogosController < ApplicationController
  before_action :set_deplo, except: [:index]
  before_action :authenticate_user!, except: [:index]

  def index
    @hyogos = Deplo.where(prefecture_id: 5)
  end

  private
  def set_deplo
    @deplo = Deplo.find(params[:deplo_id])
  end
  def deplo_params
    params.require(:deplo).permit(:deplo_title, :deplo_info, :municipality, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end
end